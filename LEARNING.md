# Learning Log

## Glossary

- **`.gd` file** — A GDScript file. Attached to a node to give it behavior,
  like the logic inside a React component.
- **`.godot/` folder** — Godot's cache of processed files. Rebuilt
  automatically, so it's ignored by git.
- **`.import` file** — Small sidecar file Godot creates next to an asset
  (image, sound) recording how it was imported. Committed to git.
- **`.tscn` file** — A saved scene ("text scene"). Plain text, so it diffs
  nicely in git.
- **GDScript** — Godot's own scripting language. Python-like syntax
  (indentation instead of braces), built to work closely with nodes.
- **Node** — The smallest building block in Godot. Each node does one job
  (draw a shape, play a sound, hold a camera). Like a built-in element such
  as `<div>` or `<input>`, or a `UIView` in UIKit.
- **`project.godot`** — The file that makes a folder a Godot project. Holds
  project settings (name, window size, main scene). Like `package.json`.
- **Project Manager** — The launcher window Godot shows first, listing your
  projects. Not the editor itself.
- **`res://`** — "The root of this project." Godot's paths start here, e.g.
  `res://scenes/main.tscn`.
- **Scene** — A saved, reusable tree of nodes. Can be any size: a single
  crew member, a room, a whole ship. Scenes nest inside other scenes, like
  React components. Unlike React, nodes are long-lived objects you change
  directly (`crew.position = ...`), not re-rendered from state.
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
