import { Router } from 'express';

import { db } from '../config/db.js';
import {
  CREATE_TRAIL,
  DELETE_TRAIL,
  GET_TRAILS,
  UPDATE_TRAIL_NAME,
} from '../queries.js';

const router = Router();

// Create
router.post('/trails', async (req, res) => {
  const {
    name,
    length,
    elevation,
    description,
    image_url,
    location_id,
    difficulty_id,
  } = req.body;

  const queryValues = [name, length, elevation, description, image_url, location_id, difficulty_id];

  const result = await db.execute(CREATE_TRAIL, queryValues);

  res.json(result[0]);
});

// Read
router.get('/trails', async (req, res) => {
  const result = await db.execute(GET_TRAILS);

  res.json(result[0]);
});

// Update
router.patch('/trails/:id', async (req, res) => {
  const { id } = req.params;
  const { name } = req.body;

  const result = await db.execute(UPDATE_TRAIL_NAME, [name, id]);

  res.json(result[0]);
});

// Delete
router.delete('/trails/:id', async (req, res) => {
  const { id } = req.params;

  const result = await db.execute(DELETE_TRAIL, [id]);

  res.json(result[0]);
});

export default router;
