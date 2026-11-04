-- Genome Medical Genetics Center: minimal read-only catalogue schema
-- Run in Supabase SQL Editor, then run seed.sql. No patient information belongs here.
create table if not exists public.panel_catalog (
  id text primary key,
  name text not null,
  group_name text not null,
  sort_order integer not null default 0,
  details jsonb not null,
  updated_at timestamptz not null default now()
);

create table if not exists public.panel_markers (
  panel_id text not null references public.panel_catalog(id) on delete cascade,
  marker text not null,
  marker_type text not null default 'gene',
  primary key (panel_id, marker)
);

create index if not exists panel_catalog_group_idx on public.panel_catalog(group_name, sort_order);
create index if not exists panel_markers_marker_idx on public.panel_markers(lower(marker));

alter table public.panel_catalog enable row level security;
alter table public.panel_markers enable row level security;

drop policy if exists "Public can read panel catalogue" on public.panel_catalog;
create policy "Public can read panel catalogue" on public.panel_catalog
  for select to anon, authenticated using (true);

drop policy if exists "Public can read panel markers" on public.panel_markers;
create policy "Public can read panel markers" on public.panel_markers
  for select to anon, authenticated using (true);

grant select on public.panel_catalog, public.panel_markers to anon, authenticated;

comment on table public.panel_catalog is 'Public clinical catalogue of tests and panels; contains no patient records.';
comment on table public.panel_markers is 'Curated searchable gene/biomarker terms documented in the supplied clinical guide.';
