CREATE OR REPLACE FUNCTION create_message()
  RETURNS TRIGGER
  LANGUAGE PLPGSQL
  AS
$$
BEGIN

	INSERT INTO insert_messages(message)
	VALUES(CONCAT('Added new employee called ', NEW.name, ' ', 'with id = ', NEW.id));

	RETURN NEW;
END;
$$

CREATE OR REPLACE FUNCTION create_delete_message()
  RETURNS TRIGGER
  LANGUAGE PLPGSQL
  AS
$$
BEGIN

	INSERT INTO insert_messages(message)
	VALUES(CONCAT('Deleted employee called ', OLD.name, ' ', 'with id = ', OLD.id));

	RETURN NEW;
END;
$$

CREATE TRIGGER add_new_employee
  BEFORE INSERT
  ON employees
  FOR EACH ROW
  EXECUTE PROCEDURE create_message();

CREATE TRIGGER delete_employee
  AFTER DELETE
  ON employees
  FOR EACH ROW
  EXECUTE PROCEDURE create_delete_message();