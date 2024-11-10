export const GET_TRAILS = `
  SELECT t.name, t.description
  FROM trails AS t
  WHERE t.id IN (SELECT r.trail_id FROM ratings AS r WHERE r.score > 4);
`;

export const CREATE_TRAIL = `
  INSERT INTO trails (name, length, elevation, description, image_url, location_id, difficulty_id) 
  VALUES (?, ?, ?, ?, ?, ?, ?)
`;

export const UPDATE_TRAIL_NAME = `
  UPDATE trails AS t
  SET t.name = ?
  WHERE t.id = ?;
`;

export const DELETE_TRAIL = `
  DELETE FROM trails AS t
  WHERE t.id = ?;
`;
