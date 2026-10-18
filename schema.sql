PRAGMA foreign_keys = ON;
CREATE TABLE IF NOT EXISTS recipients (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  greeting TEXT NOT NULL,
  photo_key TEXT,
  code_hash TEXT NOT NULL UNIQUE,
  sort_order INTEGER NOT NULL DEFAULT 0,
  created_at INTEGER NOT NULL,
  updated_at INTEGER NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_recipients_sort ON recipients(sort_order, name);
CREATE TABLE IF NOT EXISTS admin_sessions (
  id TEXT PRIMARY KEY,
  expires_at INTEGER NOT NULL,
  created_at INTEGER NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_admin_sessions_expiry ON admin_sessions(expires_at);
