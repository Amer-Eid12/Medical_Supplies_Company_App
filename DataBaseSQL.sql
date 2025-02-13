DROP DATABASE IF EXISTS medical_supplies;
CREATE DATABASE medical_supplies;
USE medical_supplies;

CREATE TABLE login (
    username VARCHAR(32) PRIMARY KEY,
    password VARCHAR(100),
	salt VARCHAR(44)
);

CREATE TABLE Employee (
    IDNumber INT auto_increment PRIMARY KEY,
    employeename VARCHAR(32),
    role VARCHAR(32),
    email VARCHAR(32),
    username VARCHAR(32),
    FOREIGN KEY (username) REFERENCES login(username) ON DELETE CASCADE
);

CREATE TABLE phone_number (
    phone VARCHAR(32),
    IDNumber INT,
    PRIMARY KEY (phone, IDNumber),
    FOREIGN KEY (IDNumber) REFERENCES Employee(IDNumber) ON DELETE CASCADE
);

CREATE TABLE customer (
    CustomerID INT auto_increment PRIMARY KEY,
    customername VARCHAR(32),
    email VARCHAR(32),
    username VARCHAR(32),
    FOREIGN KEY (username) REFERENCES login(username) 
);

CREATE TABLE contact_number (
    contact VARCHAR(32),
    CustomerID INT,
    PRIMARY KEY (contact, CustomerID),
    FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID) ON DELETE CASCADE
);

CREATE TABLE product (
    productID INT PRIMARY KEY,
    productName VARCHAR(50),
    Price DOUBLE,
    StockQuantity INT,
    productioncompany VARCHAR(32)
);

CREATE TABLE Medical_equipment (
    productID INT PRIMARY KEY,
    Warranty_Period DOUBLE,
    power_Source VARCHAR(32),
    Certification VARCHAR(32),
    Expected_Lifespan DOUBLE,
    FOREIGN KEY (productID) REFERENCES product(productID) ON DELETE CASCADE
);

CREATE TABLE Medical_supplies (
    productID INT PRIMARY KEY,
    expiration_date DATE,
    Recyclability BOOLEAN,
    usage_Instructions VARCHAR(50),
    storage_requirements VARCHAR(32),
    FOREIGN KEY (productID) REFERENCES product(productID) ON DELETE CASCADE
);

CREATE TABLE ord_er (
    orderID INT auto_increment PRIMARY KEY,
    CustomerID INT,
    amount DOUBLE,
    orderDate DATE,
    status VARCHAR(32),
    FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID)
);

CREATE TABLE OrderDetails (
    orderID INT auto_increment,
    productID INT,
    quantity int ,
    PRIMARY KEY (orderID, productID),
    FOREIGN KEY (orderID) REFERENCES ord_er(orderID) ON DELETE CASCADE,
    FOREIGN KEY (productID) REFERENCES product(productID) ON DELETE CASCADE
);

INSERT INTO login (username, password, salt) VALUES
    ('omar_manager', '3fBL4Q9OF3ivEcSVuVuFrXt76PMq98qH0+/paq2yHv4=', 'furoC5d5B5nw3DptKioRbA=='),
    ('waad_ziadeh', 'E364xChWm77eH4X/dVbdMtwdbZdZCMjRWAGVbr0yNcY=', 'LF3eLYGyOmgMzCP+3by6/A=='),
    ('yara_qaraqe', 'VT9xiXo11KvEu0dhRuBfuQRAUX75YHinoVdZg5fk2os=', 'mbe+/GDupYIzTKjBJkHUKw=='),
    ('amer_eid', 'OIYV+1bwCrZs7O/t0eFv5Z3zpgqQjp/FmX7hh/teGLM=', 'NgphtP2QWfJNA4e/vJT3XA=='),
    ('jana_alaa', 'm20XkQOU7ZJd8pj4sRT5lijlePqVUaoZnhE5inu9aJ4=', '4Pl9vrKIy9x964BsMP0tUQ=='),
    ('khaled', 'oMW0vLfscVc8jvyi1yxfzlDevztjLnVkTO8V1YPJCyY=', 'hn7n0w4FQgD/lPj7pIyoqg=='),
    ('ahmad', 'ws53eowWkEB9prAp64yUMYIJbJGIv7PkfqqP/m+uVeE=', '240ZFyydhV7eIYje8yxLTg=='),
    ('adnan', 'VzOIS1mRa5nbdmzvSEgschlfhvvuzmNt+80mr6BoGgE=', 'BVEubyVIuiGU/52h9Xc/dw=='),
    ('customer1', '9yuOkSmS+lhJZNSd5agbcZWBNTIiDfe3d8tZXlDQ6LE=', 'CGGLEEXcjOTuombPT03XqQ=='),
    ('customer2', 'u8lrmKQssxAjTCnJU5mv4DugFlkfvOA5Hw4TTOV15Nk=', 'mWpVljMIo6mqnwB5erquew=='),
    ('customer3', 'l10nAYeeKQXS72wVqVFz1MdPUdoxH6wrCl7aScJcPRk=', 'W/eO4e8TUuAK9exqlU5qng==');



INSERT INTO Employee (employeename, role, email, username) VALUES
    ('omar omer', 'Manager', 'omar56@gmail.com', 'omar_manager'),
    ('Waad Ziadeh', 'Employee', 'waad12@gmail.com', 'waad_ziadeh'),
    ('Yara Qaraqe', 'Employee', 'yara25@hotmail.com', 'yara_qaraqe'),
    ('Amer Eid', 'Employee', 'amer78@outlock.com', 'amer_eid'),
    ('Jana Alaa', 'Employee', 'jana89@live.com', 'jana_alaa'),
    ('Khaled', 'Employee', 'khaled15@gmail.com', 'khaled'),
    ('Ahmad', 'Employee', 'ahmad88@gmail.com', 'ahmad'),
    ('Adnan', 'Employee', 'adnan99@gmail.com', 'adnan');

INSERT INTO phone_number (phone, IDNumber) VALUES
    ('0511155555', 1),
    ('0511111111', 2),
    ('0522222222', 3),
    ('0595555555', 4),
    ('0591111888', 5),
    ('0592222333', 6),
    ('0593333333', 7),
    ('0594444444', 8);

INSERT INTO customer (customername, email, username) VALUES
    ('Sara Mohammed', 'sara@gmail.com', 'customer1'),
    ('Omar Ahmed', 'omar@hotmail.com', 'customer2'),
    ('Ali Hassan', 'ali@outlock.com', 'customer3');

INSERT INTO contact_number (contact, CustomerID) VALUES
    ('0591111111', 1),
    ('0592222222', 2),
    ('0593333333', 3);

INSERT INTO product (productID, productName, Price, StockQuantity, productioncompany) VALUES
(1000, 'Adult Diapers', 20.00, 200, 'HomeCare Inc.'),
(1001, 'Catheters', 15.00, 150, 'HomeCare Inc.'),
(1002, 'Urinary Supplies', 10.00, 300, 'HomeCare Inc.'),
(1003, 'Bed Pads', 12.00, 250, 'HomeCare Inc.'),
(1004, 'Incontinence Underwear', 18.00, 180, 'HomeCare Inc.'),
(1005, 'Blood Pressure Monitors', 50.00, 100, 'HealthTech Inc.'),
(1006, 'Glucose Meters', 30.00, 150, 'MediCare Ltd.'),
(1007, 'Thermometers', 10.00, 300, 'HealthTech Inc.'),
(1008, 'Pulse Oximeters', 40.00, 120, 'MediCare Ltd.'),
(1009, 'Reachers & Grabbers', 15.00, 200, 'DailyAid Corp.'),
(1010, 'Dressing Aids', 12.00, 250, 'DailyAid Corp.'),
(1011, 'Medication Management', 20.00, 150, 'DailyAid Corp.'),
(1012, 'Eating & Drinking Aids', 18.00, 180, 'DailyAid Corp.'),
(1013, 'Ostomy Supplies', 25.00, 100, 'OstoCare Ltd.'),
(1014, 'Shower Chairs', 35.00, 120, 'SafeBath Inc.'),
(1015, 'Toilet Safety Frames', 30.00, 150, 'SafeBath Inc.'),
(1016, 'Grab Bars', 20.00, 200, 'SafeBath Inc.'),
(1017, 'Raised Toilet Seats', 25.00, 180, 'SafeBath Inc.'),
(1018, 'Nebulizers', 120.00, 75, 'RespiraCorp'),
(1019, 'CPAP Machines', 200.00, 50, 'RespiraCorp'),
(1020, 'Oxygen Concentrators', 300.00, 40, 'RespiraCorp'),
(1021, 'Humidifiers', 50.00, 100, 'RespiraCorp'),
(1022, 'Suction Machines', 150.00, 60, 'RespiraCorp'),
(1023, 'Scales', 40.00, 120, 'DiagnoTech Inc.'),
(1024, 'Thermometers', 10.00, 300, 'DiagnoTech Inc.'),
(1025, 'Blood Pressure Monitors', 50.00, 100, 'DiagnoTech Inc.'),
(1026, 'Diagnostic Lights', 30.00, 150, 'DiagnoTech Inc.'),
(1027, 'Pulse Oximetry', 40.00, 120, 'DiagnoTech Inc.'),
(1028, 'Stethoscopes', 25.00, 200, 'DiagnoTech Inc.'),
(1029, 'Circumference & Height Measuring Devices', 60.00, 80, 'DiagnoTech Inc.'),
(1030, 'Height Measuring Devices', 50.00, 100, 'DiagnoTech Inc.'),
(1031, 'Measuring Rods', 20.00, 200, 'DiagnoTech Inc.'),
(1032, 'Measuring Tapes', 10.00, 300, 'DiagnoTech Inc.'),
(1033, 'First Aid Kits', 25.00, 200, 'FirstAid Corp.'),
(1034, 'Aspirator Pumps & Accessories', 50.00, 100, 'FirstAid Corp.'),
(1035, 'Laryngoscopy', 100.00, 50, 'FirstAid Corp.'),
(1036, 'AED & Defibrillators', 300.00, 40, 'FirstAid Corp.'),
(1037, 'Resuscitation Masks', 15.00, 200, 'FirstAid Corp.'),
(1038, 'Emergency Blankets', 10.00, 300, 'FirstAid Corp.'),
(1039, 'Splints & Braces', 20.00, 200, 'FirstAid Corp.'),
(1040, 'Burn Care', 15.00, 250, 'FirstAid Corp.'),
(1041, 'Wound Care', 18.00, 180, 'FirstAid Corp.'),
(1042, 'Gauze', 5.00, 500, 'FirstAid Corp.'),
(1043, 'Splint & Cast Supplies', 20.00, 200, 'FirstAid Corp.'),
(1044, 'Tapes', 8.00, 400, 'FirstAid Corp.'),
(1045, 'Bandages', 10.00, 300, 'FirstAid Corp.'),
(1046, 'Wound Closures', 15.00, 250, 'FirstAid Corp.'),
(1047, 'Plasters & Wound Dressings', 12.00, 300, 'FirstAid Corp.'),
(1048, 'Surgical Instruments', 200.00, 50, 'SurgiTech Inc.'),
(1049, 'Surgical Sutures', 30.00, 150, 'SurgiTech Inc.'),
(1050, 'Disinfection & Cleaning', 20.00, 200, 'HygienePro Ltd.'),
(1051, 'Gloves & Accessories', 10.00, 300, 'HygienePro Ltd.'),
(1052, 'Skin & Hand Care', 15.00, 250, 'HygienePro Ltd.'),
(1053, 'Surface Disinfectants', 18.00, 180, 'HygienePro Ltd.'),
(1054, 'Textiles', 12.00, 300, 'HygienePro Ltd.'),
(1055, 'Hand Sanitizer Dispensers', 25.00, 200, 'DispenserTech Inc.'),
(1056, 'Glove Dispensers', 20.00, 200, 'DispenserTech Inc.'),
(1057, 'Towel Dispensers', 30.00, 150, 'DispenserTech Inc.'),
(1058, 'Autoclaves & Sterilizers', 500.00, 30, 'SteriTech Ltd.'),
(1059, 'Foil Sealing Machines', 200.00, 50, 'SteriTech Ltd.'),
(1060, 'Sterilization Containers & Trays', 100.00, 80, 'SteriTech Ltd.'),
(1061, 'Sterilization Packaging', 50.00, 120, 'SteriTech Ltd.'),
(1062, 'Ultrasonic Cleaning Devices', 150.00, 60, 'SteriTech Ltd.'),
(1063, 'Cannulas', 10.00, 300, 'InjTech Inc.'),
(1064, 'Syringes', 5.00, 500, 'InjTech Inc.'),
(1065, 'Infusion & Transfusion', 50.00, 100, 'InjTech Inc.'),
(1066, 'Injection & Infusion Accessories', 20.00, 200, 'InjTech Inc.'),
(1067, 'Blood Collection', 15.00, 250, 'InjTech Inc.'),
(1068, 'Compression Stockings', 20.00, 200, 'OrthoCare Ltd.'),
(1069, 'Orthopedic Support', 30.00, 150, 'OrthoCare Ltd.'),
(1070, 'Braces & Supports', 40.00, 120, 'OrthoCare Ltd.'),
(1071, 'Casts & Splints', 25.00, 200, 'OrthoCare Ltd.'),
(1072, 'Orthopedic Footwear', 50.00, 100, 'OrthoCare Ltd.'),
(1073, 'Hot & Cold Therapy', 35.00, 120, 'OrthoCare Ltd.'),
(1074, 'Traction Equipment', 200.00, 50, 'OrthoCare Ltd.'),
(1075, 'Wheelchairs', 300.00, 40, 'MobilityAid Inc.'),
(1076, 'Walkers & Rollators', 100.00, 80, 'MobilityAid Inc.'),
(1077, 'Canes & Crutches', 50.00, 120, 'MobilityAid Inc.'),
(1078, 'Adult Diapers (Large)', 22.00, 150, 'HomeCare Inc.'),
(1079, 'Catheters (Flexible)', 18.00, 200, 'HomeCare Inc.'),
(1080, 'Bed Pads (Waterproof)', 14.00, 300, 'HomeCare Inc.'),
(1081, 'Blood Pressure Monitors (Wrist)', 60.00, 80, 'HealthTech Inc.'),
(1082, 'Glucose Meters (Advanced)', 35.00, 120, 'MediCare Ltd.'),
(1083, 'Thermometers (Infrared)', 15.00, 250, 'HealthTech Inc.'),
(1084, 'Reachers & Grabbers (Heavy Duty)', 20.00, 150, 'DailyAid Corp.'),
(1085, 'Dressing Aids (Magnetic)', 15.00, 200, 'DailyAid Corp.'),
(1086, 'Medication Management (Weekly)', 25.00, 120, 'DailyAid Corp.'),
(1087, 'Ostomy Supplies (Compact)', 30.00, 100, 'OstoCare Ltd.'),
(1088, 'Shower Chairs (Adjustable)', 40.00, 100, 'SafeBath Inc.'),
(1089, 'Grab Bars (Wall-Mounted)', 25.00, 150, 'SafeBath Inc.'),
(1090, 'Raised Toilet Seats (Padded)', 30.00, 120, 'SafeBath Inc.'),
(1091, 'Nebulizers (Portable)', 130.00, 60, 'RespiraCorp'),
(1092, 'CPAP Machines (Travel)', 220.00, 40, 'RespiraCorp'),
(1093, 'Oxygen Concentrators (Lightweight)', 320.00, 30, 'RespiraCorp'),
(1094, 'Scales (Digital)', 45.00, 100, 'DiagnoTech Inc.'),
(1095, 'Thermometers (Ear)', 12.00, 300, 'DiagnoTech Inc.'),
(1096, 'Blood Pressure Monitors (Arm)', 55.00, 90, 'DiagnoTech Inc.'),
(1097, 'First Aid Kits (Travel)', 30.00, 150, 'FirstAid Corp.'),
(1098, 'AED & Defibrillators (Portable)', 350.00, 30, 'FirstAid Corp.'),
(1099, 'Burn Care (Advanced)', 20.00, 200, 'FirstAid Corp.'),
(1100, 'Surgical Instruments (Laser)', 250.00, 40, 'SurgiTech Inc.'),
(1101, 'Surgical Sutures (Absorbable)', 35.00, 120, 'SurgiTech Inc.'),
(1102, 'Disinfection & Cleaning (Alcohol-Free)', 22.00, 200, 'HygienePro Ltd.'),
(1103, 'Gloves & Accessories (Nitrile)', 12.00, 300, 'HygienePro Ltd.'),
(1104, 'Skin & Hand Care (Moisturizing)', 18.00, 180, 'HygienePro Ltd.'),
(1105, 'Hand Sanitizer Dispensers (Automatic)', 30.00, 150, 'DispenserTech Inc.'),
(1106, 'Glove Dispensers (Wall-Mounted)', 25.00, 200, 'DispenserTech Inc.'),
(1107, 'Towel Dispensers (Automatic)', 35.00, 120, 'DispenserTech Inc.'),
(1108, 'Cannulas (Safety)', 12.00, 250, 'InjTech Inc.'),
(1109, 'Syringes (Insulin)', 6.00, 400, 'InjTech Inc.'),
(1110, 'Infusion & Transfusion (Pediatric)', 60.00, 80, 'InjTech Inc.'),
(1111, 'Compression Stockings (Knee-High)', 25.00, 150, 'OrthoCare Ltd.'),
(1112, 'Orthopedic Support (Back)', 35.00, 120, 'OrthoCare Ltd.'),
(1113, 'Braces & Supports (Ankle)', 45.00, 100, 'OrthoCare Ltd.'),
(1114, 'Wheelchairs (Lightweight)', 350.00, 30, 'MobilityAid Inc.'),
(1115, 'Walkers & Rollators (Folding)', 120.00, 60, 'MobilityAid Inc.'),
(1116, 'Canes & Crutches (Adjustable)', 60.00, 100, 'MobilityAid Inc.');

INSERT INTO Medical_equipment (productID, Warranty_Period, power_Source, Certification, Expected_Lifespan) VALUES
(1005, 2.5, 'Battery', 'FDA Approved', 5.0),
(1006, 2.0, 'Battery', 'CE Certified', 4.0),
(1007, 1.5, 'Battery', 'FDA Approved', 3.0),
(1008, 2.0, 'Battery', 'CE Certified', 4.0),
(1018, 3.0, 'AC/DC', 'FDA Approved', 7.0),
(1019, 3.5, 'AC/DC', 'FDA Approved', 8.0),
(1020, 4.0, 'AC/DC', 'FDA Approved', 10.0),
(1021, 2.0, 'AC/DC', 'CE Certified', 5.0),
(1022, 3.0, 'AC/DC', 'FDA Approved', 7.0),
(1023, 2.0, 'Battery', 'CE Certified', 5.0),
(1025, 2.5, 'Battery', 'FDA Approved', 5.0),
(1026, 1.5, 'AC/DC', 'CE Certified', 4.0),
(1027, 2.0, 'Battery', 'FDA Approved', 5.0),
(1028, 1.0, 'None', 'FDA Approved', 3.0),
(1029, 2.0, 'None', 'CE Certified', 5.0),
(1030, 2.0, 'None', 'CE Certified', 5.0),
(1036, 5.0, 'Battery', 'FDA Approved', 10.0),
(1058, 5.0, 'AC/DC', 'FDA Approved', 10.0),
(1059, 3.0, 'AC/DC', 'CE Certified', 7.0),
(1060, 2.0, 'None', 'CE Certified', 5.0),
(1062, 3.0, 'AC/DC', 'FDA Approved', 7.0),
(1075, 3.0, 'None', 'CE Certified', 8.0),
(1076, 2.0, 'None', 'CE Certified', 5.0),
(1077, 1.5, 'None', 'CE Certified', 4.0),
(1081, 2.5, 'Battery', 'FDA Approved', 5.0),
(1082, 2.0, 'Battery', 'CE Certified', 4.0),
(1083, 1.5, 'Battery', 'FDA Approved', 3.0),
(1091, 3.0, 'AC/DC', 'FDA Approved', 7.0),
(1092, 3.5, 'AC/DC', 'FDA Approved', 8.0),
(1093, 4.0, 'AC/DC', 'FDA Approved', 10.0),
(1094, 2.0, 'Battery', 'CE Certified', 5.0),
(1095, 1.5, 'Battery', 'FDA Approved', 3.0),
(1096, 2.5, 'Battery', 'FDA Approved', 5.0),
(1098, 5.0, 'Battery', 'FDA Approved', 10.0),
(1100, 3.0, 'None', 'FDA Approved', 7.0),
(1114, 3.0, 'None', 'CE Certified', 8.0),
(1115, 2.0, 'None', 'CE Certified', 5.0),
(1116, 1.5, 'None', 'CE Certified', 4.0);

INSERT INTO Medical_supplies (productID, expiration_date, Recyclability, usage_Instructions, storage_requirements) VALUES
(1000, '2025-12-31', TRUE, 'Disposable', 'Store in a dry place'),
(1001, '2025-12-31', FALSE, 'Single-use only', 'Store in a sterile environment'),
(1002, '2025-12-31', FALSE, 'Single-use only', 'Store in a sterile environment'),
(1003, '2025-12-31', TRUE, 'Disposable', 'Store in a dry place'),
(1004, '2025-12-31', TRUE, 'Disposable', 'Store in a dry place'),
(1009, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1010, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1011, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1012, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1013, '2025-12-31', FALSE, 'Single-use only', 'Store in a sterile environment'),
(1014, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1015, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1016, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1017, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1033, '2025-12-31', TRUE, 'Disposable', 'Store in a dry place'),
(1034, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1037, '2025-12-31', FALSE, 'Single-use only', 'Store in a sterile environment'),
(1038, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1039, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1040, '2025-12-31', FALSE, 'Single-use only', 'Store in a sterile environment'),
(1041, '2025-12-31', FALSE, 'Single-use only', 'Store in a sterile environment'),
(1042, '2025-12-31', FALSE, 'Single-use only', 'Store in a sterile environment'),
(1043, '2025-12-31', FALSE, 'Single-use only', 'Store in a sterile environment'),
(1044, '2025-12-31', FALSE, 'Single-use only', 'Store in a sterile environment'),
(1045, '2025-12-31', FALSE, 'Single-use only', 'Store in a sterile environment'),
(1046, '2025-12-31', FALSE, 'Single-use only', 'Store in a sterile environment'),
(1047, '2025-12-31', FALSE, 'Single-use only', 'Store in a sterile environment'),
(1048, NULL, TRUE, 'Reusable', 'Store in a sterile environment'),
(1049, '2025-12-31', FALSE, 'Single-use only', 'Store in a sterile environment'),
(1050, '2025-12-31', FALSE, 'Single-use only', 'Store in a dry place'),
(1051, '2025-12-31', FALSE, 'Single-use only', 'Store in a dry place'),
(1052, '2025-12-31', FALSE, 'Single-use only', 'Store in a dry place'),
(1053, '2025-12-31', FALSE, 'Single-use only', 'Store in a dry place'),
(1054, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1055, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1056, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1057, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1063, '2025-12-31', FALSE, 'Single-use only', 'Store in a sterile environment'),
(1064, '2025-12-31', FALSE, 'Single-use only', 'Store in a sterile environment'),
(1065, '2025-12-31', FALSE, 'Single-use only', 'Store in a sterile environment'),
(1066, '2025-12-31', FALSE, 'Single-use only', 'Store in a sterile environment'),
(1067, '2025-12-31', FALSE, 'Single-use only', 'Store in a sterile environment'),
(1068, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1069, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1070, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1071, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1072, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1073, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1074, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1078, '2025-12-31', TRUE, 'Disposable', 'Store in a dry place'),
(1079, '2025-12-31', FALSE, 'Single-use only', 'Store in a sterile environment'),
(1080, '2025-12-31', TRUE, 'Disposable', 'Store in a dry place'),
(1084, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1085, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1086, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1087, '2025-12-31', FALSE, 'Single-use only', 'Store in a sterile environment'),
(1088, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1089, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1090, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1097, '2025-12-31', TRUE, 'Disposable', 'Store in a dry place'),
(1099, '2025-12-31', FALSE, 'Single-use only', 'Store in a sterile environment'),
(1101, '2025-12-31', FALSE, 'Single-use only', 'Store in a sterile environment'),
(1102, '2025-12-31', FALSE, 'Single-use only', 'Store in a dry place'),
(1103, '2025-12-31', FALSE, 'Single-use only', 'Store in a dry place'),
(1104, '2025-12-31', FALSE, 'Single-use only', 'Store in a dry place'),
(1105, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1106, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1107, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1108, '2025-12-31', FALSE, 'Single-use only', 'Store in a sterile environment'),
(1109, '2025-12-31', FALSE, 'Single-use only', 'Store in a sterile environment'),
(1110, '2025-12-31', FALSE, 'Single-use only', 'Store in a sterile environment'),
(1111, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1112, NULL, TRUE, 'Reusable', 'Store in a dry place'),
(1113, NULL, TRUE, 'Reusable', 'Store in a dry place');

INSERT INTO ord_er (CustomerID, amount, orderDate, status) VALUES
    (1, 150.75, '2023-10-01', 'Pending'),
    (2, 200.50, '2023-9-02', 'Pending'),
    (1, 99.99, '2023-12-03', 'Pending'),
    (2, 450.00, '2023-11-04', 'Pending'),
    (1, 75.25, '2023-2-13', 'Pending'),
    (2, 300.00, '2023-5-06', 'Pending');

INSERT INTO OrderDetails (orderID, productID, quantity) VALUES
    (1, 1001, 2),
    (1, 1002, 1),
    (2, 1003, 3),
    (3, 1001, 1),
    (4, 1004, 2),
    (5, 1002, 1),
    (6, 1005, 4);

SELECT * FROM login;
SELECT * FROM Employee;
SELECT * FROM phone_number;
SELECT * FROM customer;
SELECT * FROM contact_number;
SELECT * FROM product;
SELECT * FROM Medical_equipment;
SELECT * FROM Medical_supplies;
SELECT * FROM ord_er;
SELECT * FROM OrderDetails;