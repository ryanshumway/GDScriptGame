# Learning Log

## Glossary

- **`class_name`** — Gives a script a global name (e.g. `Room`) so other
  scripts can use it as a type and read its constants (`Room.TILE_SIZE`).
- **`const`** — A value that never changes.
- **`_draw()`** — A function Godot calls when a node needs to paint
  itself. You draw shapes inside it with `draw_rect`, `draw_circle`, etc.
  Runs once, then again only when asked (`queue_redraw()`), not every frame.
- **`@export`** — Marks a variable so it shows up in the editor's
  Inspector, where you can change it without touching code. Like a prop
  with a default value.
- **`extends`** — Says which built-in node type a script builds on, like
  subclassing in Swift (`class Room: Node2D`).
- **`.gd` file** — A GDScript file. Attached to a node to give it behavior,
  like the logic inside a React component.
- **GDScript** — Godot's own scripting language. Python-like syntax
  (indentation instead of braces), built to work closely with nodes.
- **`.godot/` folder** — Godot's cache of processed files. Rebuilt
  automatically, so it's ignored by git.
- **`.import` file** — Small sidecar file Godot creates next to an asset
  (image, sound) recording how it was imported. Committed to git.
- **Instance (of a scene)** — A copy of a saved scene placed inside another
  scene. Like writing `<Room />` in JSX.
- **Main scene** — The scene Godot starts when you press Play. Set in
  `project.godot` (`run/main_scene`).
- **Node** — The smallest building block in Godot. Each node does one job
  (draw a shape, play a sound, hold a camera). Like a built-in element such
  as `<div>` or `<input>`, or a `UIView` in UIKit.
- **Node2D** — The basic node for 2D things. Has a position, rotation and
  scale. Children move with their parent.
- **Position (local)** — A node's position is relative to its parent, not
  the screen. Move the parent and all children move with it.
- **Project Manager** — The launcher window Godot shows first, listing your
  projects. Not the editor itself.
- **`project.godot`** — The file that makes a folder a Godot project. Holds
  project settings (name, window size, main scene). Like `package.json`.
- **`_ready()`** — Called once when a node (and all its children) has been
  added to the running game. Like `useEffect(() => {}, [])` or
  `viewDidLoad`.
- **Rect2 / Vector2 / Vector2i** — Built-in types. `Vector2` is an (x, y)
  pair of decimals (pixels); `Vector2i` is an (x, y) pair of whole numbers
  (tile coordinates). `Rect2` is a rectangle: position + size.
- **`res://`** — "The root of this project." Godot's paths start here, e.g.
  `res://scenes/main.tscn`.
- **Scene** — A saved, reusable tree of nodes. Can be any size: a single
  crew member, a room, a whole ship. Scenes nest inside other scenes, like
  React components. Unlike React, nodes are long-lived objects you change
  directly (`crew.position = ...`), not re-rendered from state.
- **Tile** — One square cell of a grid. Game logic thinks in tiles
  (`(2, 3)`); drawing thinks in pixels (`(120, 168)`). Converting between
  the two is a constant job.
- **`.tscn` file** — A saved scene ("text scene"). Plain text, so it diffs
  nicely in git.
- **Viewport** — The area the game draws into. Its size is set in
  `project.godot` (we use 1280×720).

## What we learned

### Step 1 — Project structure

- A Godot project is just a folder containing `project.godot`.
- We organize by file type: `scenes/`, `scripts/`, `assets/`.
- Git doesn't track empty folders, so each starts with a `.gitkeep`
  placeholder file.
- `.godot/` is a cache — never committed. `.import` files *are* committed.
- Ryan's mental model: a Ship scene contains Room scenes, CrewMember
  scenes and Weapon scenes — composition, like React components.

### Step 2 — One room and a placeholder character

- Scene tree: `Main` → `Floorplan` → (`Room`, `CrewMember`). `Room` and
  `CrewMember` are their own scenes, instanced into `main.tscn`.
- The crew member is a *sibling* of the room, not its child, because crew
  will later walk between rooms.
- `Floorplan` exists so we can move the whole layout on screen by changing
  one position.
- Shapes are painted in `_draw()` with `draw_rect` and `draw_circle`.
- Logic uses **tile coordinates** (`Vector2i`); drawing uses **pixels**
  (`Vector2`). `tile_to_pixels()` converts: `tile * TILE_SIZE + half a tile`.
- `@export` variables can be tweaked in the Inspector.
