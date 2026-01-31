-- Create works table
CREATE TABLE IF NOT EXISTS works (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    description TEXT,
    location VARCHAR(255),
    year VARCHAR(50),
    image_url TEXT,
    featured BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable RLS
ALTER TABLE works ENABLE ROW LEVEL SECURITY;

-- Policies
DO $$ 
BEGIN
    IF NOT EXISTS (
        SELECT FROM pg_policies WHERE tablename = 'works' AND policyname = 'Public can view works'
    ) THEN
        CREATE POLICY "Public can view works" ON works FOR SELECT USING (true);
    END IF;

    IF NOT EXISTS (
        SELECT FROM pg_policies WHERE tablename = 'works' AND policyname = 'Admin can manage works'
    ) THEN
        CREATE POLICY "Admin can manage works" ON works FOR ALL USING (auth.role() = 'authenticated');
    END IF;
END $$;

-- Indexes
CREATE INDEX IF NOT EXISTS idx_works_created_at ON works(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_works_featured ON works(featured) WHERE featured = true;
