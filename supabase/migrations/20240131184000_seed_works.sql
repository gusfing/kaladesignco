-- Insert sample works data
INSERT INTO works (title, category, description, location, year, image_url, featured) VALUES
('Nakra Residence', 'Residential', 'A modern sanctuary blending minimalist aesthetics with warm, natural materials. Premium interior design featuring bespoke finishes and sophisticated lighting solutions.', 'India', '2024', './assets/projects/nakra-1.jpg', true),
('Project Shree', 'Residential', 'Contemporary luxury residence featuring open floor plans and seamless indoor-outdoor living. Meticulous attention to material selection and spatial flow.', 'India', '2024', './assets/projects/shree-1.jpg', true),
('ATCG Office', 'Commercial', 'Modern corporate workspace designed to inspire collaboration. Features flexible zones, premium finishes, and ergonomic planning for the contemporary workforce.', 'India', '2025', './assets/projects/atcg-1.jpg', true),
('Gaur Industrial Office', 'Commercial', 'Corporate headquarters featuring MD room, meeting spaces, and modern workstations. A sophisticated environment that balances professionalism with comfort.', 'India', '2025', './assets/projects/guar-2.jpg', true)
ON CONFLICT DO NOTHING;
