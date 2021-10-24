-- Единственный индекс имеющий смыйсл не созданный автоматически
CREATE INDEX persons_first_name_last_name_idx ON persons(first_name, last_name);
