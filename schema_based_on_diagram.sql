CREATE DATABASE hospital;
\c hospital;


CREATE TABLE patients(
patient_id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(200),
date_of_birth DATE,
PRIMARY KEY (patient_id)
);

CREATE TABLE medical_histories(
medical_histories_id INT GENERATED ALWAYS AS IDENTITY,
admitted_at TIMESTAMP,
patient_id INT,
status VARCHAR(500),
PRIMARY KEY (medical_histories_id),
CONSTRAINT fk_patient
  FOREIGN KEY(patient_id)
    REFERENCES patients(patient_id)
);

CREATE TABLE treatments(
treatment_id INT GENERATED ALWAYS AS IDENTITY,
type VARCHAR(200),
name VARCHAR(200),
PRIMARY KEY (treatment_id)
);

CREATE TABLE invoices(
  invoice_id INT GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_histories_id INT,
  PRIMARY KEY (invoice_id),
  CONSTRAINT fk_medical_histories_id
    FOREIGN KEY(medical_histories_id)
      REFERENCES medical_histories(medical_histories_id)
);

CREATE TABLE invoice_items(
invoice_item_id INT GENERATED ALWAYS AS IDENTITY,
unit_price DECIMAL,
quantity INT,
total_price DECIMAL,
invoice_id INT,
treatment_id INT,
PRIMARY KEY (invoice_item_id),
CONSTRAINT fk_invoices
  FOREIGN KEY(invoice_id)
    REFERENCES invoices(invoice_id),
CONSTRAINT fk_treatments
  FOREIGN KEY(treatment_id)
    REFERENCES treatments(treatment_id)
);

--JOIN TABLE

CREATE TABLE treatment_records(
  medical_histories_id INT,
  treatment_id INT,
  CONSTRAINT fk_medical_histories
    FOREIGN KEY(medical_histories_id)
      REFERENCES medical_histories(medical_histories_id),
  CONSTRAINT fk_treatments_record
    FOREIGN KEY(treatment_id)
      REFERENCES treatments(treatment_id)
);


