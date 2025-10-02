
-- V2__add_status_and_index.sql
ALTER TABLE subscribers ADD COLUMN IF NOT EXISTS status ENUM('active','inactive') DEFAULT 'active';
CREATE INDEX IF NOT EXISTS idx_created_at ON subscribers(created_at);
