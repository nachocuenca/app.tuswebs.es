ALTER TABLE landings ADD COLUMN IF NOT EXISTS slug VARCHAR(128) NULL UNIQUE AFTER cliente_id;
CREATE INDEX IF NOT EXISTS idx_landings_slug ON landings(slug);
