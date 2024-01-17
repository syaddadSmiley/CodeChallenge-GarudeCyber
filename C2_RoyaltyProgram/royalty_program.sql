drop database royalty_program;
-- Create the database
CREATE DATABASE royalty_program;

-- Use the database
USE royalty_program;

-- Create the users table
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  password VARCHAR(100) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the tenants table
CREATE TABLE tenants (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the invoices table
CREATE TABLE invoices (
  id INT AUTO_INCREMENT PRIMARY KEY,
  tenant_id INT NOT NULL,
  user_id INT NOT NULL,
  transaction_id VARCHAR(50) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (tenant_id) REFERENCES tenants(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Create the vouchers table
CREATE TABLE vouchers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  voucher_code VARCHAR(50) NOT NULL,
  expired_at TIMESTAMP NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Create the transactions table
CREATE TABLE transactions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  invoice_id INT NOT NULL,
  voucher_id INT NOT NULL,
  amount INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (invoice_id) REFERENCES invoices(id),
  FOREIGN KEY (voucher_id) REFERENCES vouchers(id)
);

-- Create the rewards table
CREATE TABLE rewards (
  id INT AUTO_INCREMENT PRIMARY KEY,
  tenant_id INT NOT NULL,
  name VARCHAR(100) NOT NULL,
  description VARCHAR(255) NOT NULL,
  point INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (tenant_id) REFERENCES tenants(id)
);

-- Create the rewards_redemptions table
CREATE TABLE rewards_redemptions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  reward_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (reward_id) REFERENCES rewards(id)
);

-- Insert dummy data into the users table
INSERT INTO users (name, email, password, phone) VALUES
('Budi Santoso', 'budi.santoso@mail.com', '$2y$10$79a9c2e9a49d010b31d5eOav8wMkYoIcbbQIHRmN6dAsTYNLoQhcy', '081234567890'),
('Dewi Rahayu', 'dewi.rahayu@mail.com', '$2y$10$79a9c2e9a49d010b31d5eOav8wMkYoIcbbQIHRmN6dAsTYNLoQhcy', '087654321098'),
('Putra Pratama', 'putra.pratama@mail.com', '$2y$10$79a9c2e9a49d010b31d5eOav8wMkYoIcbbQIHRmN6dAsTYNLoQhcy', '085551234567'),
('Anita Setiawati', 'anita.setiawati@mail.com', '$2y$10$79a9c2e9a49d010b31d5eOav8wMkYoIcbbQIHRmN6dAsTYNLoQhcy', '089998765432'),
('Adi Nugroho', 'adi.nugroho@mail.com', '$2y$10$79a9c2e9a49d010b31d5eOav8wMkYoIcbbQIHRmN6dAsTYNLoQhcy', '081112233445'),
('Rini Permata', 'rini.permata@mail.com', '$2y$10$79a9c2e9a49d010b31d5eOav8wMkYoIcbbQIHRmN6dAsTYNLoQhcy', '06667778888'),
('Deni Laksono', 'deni.laksono@mail.com', '$2y$10$79a9c2e9a49d010b31d5eOav8wMkYoIcbbQIHRmN6dAsTYNLoQhcy', '04445556666'),
('Sari Indah', 'sari.indah@mail.com', '$2y$10$79a9c2e9a49d010b31d5eOav8wMkYoIcbbQIHRmN6dAsTYNLoQhcy', '1239876543'),
('Hadi Wijaya', 'hadi.wijaya@mail.com', '$2y$10$79a9c2e9a49d010b31d5eOav8wMkYoIcbbQIHRmN6dAsTYNLoQhcy', '07778889999'),
('Siti Nurhayati', 'siti.nurhayati@mail.com', '$2y$10$79a9c2e9a49d010b31d5eOav8wMkYoIcbbQIHRmN6dAsTYNLoQhcy', '03334445555');
-- Password : 123

-- Insert dummy data into the tenants table
INSERT INTO tenants (name) VALUES
('Tenant 1'),
('Tenant 2'),
('Tenant 3'),
('Tenant 4'),
('Tenant 5'),
('Tenant 6'),
('Tenant 7'),
('Tenant 8'),
('Tenant 9'),
('Tenant 10');

-- Insert dummy data into the invoices table
INSERT INTO invoices (tenant_id, user_id, transaction_id) VALUES
(1, 1, 'ABC123'),
(2, 2, 'DEF456'),
(3, 3, 'GHI789'),
(4, 4, 'JKL012'),
(5, 5, 'MNO345'),
(6, 6, 'PQR678'),
(7, 7, 'STU901'),
(8, 8, 'VWX234'),
(9, 9, 'YZA567'),
(10, 10, 'BCD890');

-- Insert dummy data into the vouchers table
INSERT INTO vouchers (user_id, voucher_code, expired_at) VALUES
(1, 'Voucher1', '2024-04-01'),
(2, 'Voucher2', '2024-04-15'),
(3, 'Voucher3', '2024-05-01'),
(4, 'Voucher4', '2024-05-15'),
(5, 'Voucher5', '2024-06-01'),
(6, 'Voucher6', '2024-06-15'),
(7, 'Voucher7', '2024-07-01'),
(8, 'Voucher8', '2024-07-15'),
(9, 'Voucher9', '2024-08-01'),
(10, 'Voucher10', '2024-08-15');

-- Insert dummy data into the transactions table
INSERT INTO transactions (invoice_id, voucher_id, amount) VALUES
(1, 1, 500000),
(2, 2, 600000),
(3, 3, 700000),
(4, 4, 800000),
(5, 5, 900000),
(6, 6, 1000000),
(7, 7, 1100000),
(8, 8, 1200000),
(9, 9, 1300000),
(10, 10, 1400000);

-- Insert dummy data into the rewards table
INSERT INTO rewards (tenant_id, name, description, point) VALUES
(1, 'Reward1', 'Description1', 100),
(2, 'Reward2', 'Description2', 150),
(3, 'Reward3', 'Description3', 200),
(4, 'Reward4', 'Description4', 250),
(5, 'Reward5', 'Description5', 300),
(6, 'Reward6', 'Description6', 350),
(7, 'Reward7', 'Description7', 400),
(8, 'Reward8', 'Description8', 450),
(9, 'Reward9', 'Description9', 500),
(10, 'Reward10', 'Description10', 550);

-- Insert dummy data into the rewards_redemptions table
INSERT INTO rewards_redemptions (user_id, reward_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);


