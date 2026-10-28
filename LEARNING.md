# Learning Log

## Glossary

- **A\* ("A-star")** — A classic search for the shortest route on a map.
  Explores tiles in order of *steps so far + guessed steps remaining*, so
  it heads toward the goal and fans out around walls.
- **Alpha** — A color's opacity, the 4th value in `Color(r, g, b, a)`.
  `1.0` is solid, `0.35` is mostly see-through.
- **`AStarGrid2D`** — Godot's built-in A\* for square grids. Set its
  `region` (grid size), call `update()`, mark blocked tiles with
  `set_point_solid()`, then ask `get_id_path(from, to)` for a list of tiles.
- **`back()`** — Returns the last item of an array. Like JS `.at(-1)`.
- **`clampf()`** — Forces a decimal into a range: `clampf(150, 0, 100)` →
  `100`. Like `Math.min(Math.max(v, lo), hi)`. `clampi` is the whole-number
  version.
- **`class_name`** — Gives a script a global name (e.g. `Room`) so other
  scripts can use it as a type and read its constants (`Room.TILE_SIZE`).
- **`Color`** — `Color(r, g, b)` with each channel 0.0–1.0 (not 0–255;
  divide by 255 to convert). Optional 4th value is alpha (opacity).
  Hex works too: `Color("#5C7A99")`. `@export`ed colors get a color
  picker in the Inspector.
- **`const`** — A value that never changes.
- **Default vs. override** — The value written in a script
  (`@export var x := 5`) is the *default*. Changing it on one node in the
  Inspector *overrides* it for that node only, and a ↺ arrow appears to
  reset it. Like a default prop value vs. a prop you pass.
- **`delta`** — The number of seconds since the last frame (about 0.016 at
  60 FPS). Multiply speeds by it so movement is the same on fast and slow
  computers: `distance = speed * delta`.
- **`_draw()`** — A function Godot calls when a node needs to paint
  itself. You draw shapes inside it with `draw_rect`, `draw_circle`, etc.
  Runs once, then again only when asked (`queue_redraw()`), not every frame.
  By default it only runs in the game, not in the editor's canvas.
- **Draw order** — Siblings draw top to bottom in the Scene panel, so the
  last child is on top. Children draw over their parent. Inside `_draw`,
  later calls paint over earlier ones. `z_index` overrides this, like CSS.
- **`draw_arc()`** — Draws part of a circle's outline: center, radius,
  start angle, end angle, segment count, color, width. `0` to `TAU` is a
  full ring.
- **Early return** — Exiting a function at the top when there's nothing to
  do (`if not ...: return`), so the rest of the code stays un-nested.
- **`elif`** — GDScript's `else if`.
- **`@export`** — Marks a variable so it shows up in the editor's
  Inspector, where you can change it without touching code. Like a prop
  with a default value.
- **`extends`** — Says which built-in node type a script builds on, like
  subclassing in Swift (`class Room: Node2D`).
- **FileSystem panel** — Bottom-left in the editor. Shows files and folders
  on disk, like Finder. Dragging here *moves* files.
- **`floor()`** — Rounds down. `2.7` → `2`. Used to turn pixels into tiles.
- **Frame** — One redraw of the screen. Games redraw about 60 times per
  second, whether or not anything changed.
- **Game loop** — The engine's endless cycle: handle input, update every
  node (`_process`), draw, repeat. Unlike a web app, which waits for events.
- **`.gd` file** — A GDScript file. Attached to a node to give it behavior,
  like the logic inside a React component.
- **GDScript** — Godot's own scripting language. Python-like syntax
  (indentation instead of braces), built to work closely with nodes.
- **`get_children()`** — Returns a list of a node's direct children, so
  you can loop over them: `for child in get_children():`.
- **`.godot/` folder** — Godot's cache of processed files. Rebuilt
  automatically, so it's ignored by git.
- **Health / max health** — Two numbers; a health bar shows their ratio
  (`health / max_health`), like a progress bar's `width: 40%`.
- **Hit test** — Working out what's under the mouse. For a circle: is the
  distance from the click to its center less than its radius?
- **`.import` file** — Small sidecar file Godot creates next to an asset
  (image, sound) recording how it was imported. Committed to git.
- **Input event (`InputEvent`)** — An object describing one input: a key
  press, a mouse move, a click. Mouse clicks are `InputEventMouseButton`.
- **Inspector** — Right-hand panel in the editor. Shows and edits the
  properties of the selected node, including its attached script.
- **Instance (of a scene)** — A copy of a saved scene placed inside another
  scene. Like writing `<Room />` in JSX.
- **Main scene** — The scene Godot starts when you press Play. Set in
  `project.godot` (`run/main_scene`).
- **`move_toward()`** — Moves a point up to N pixels toward another point,
  never overshooting. `position.move_toward(target, speed * delta)`.
- **`.new()`** — Creates an object from a class: `AStarGrid2D.new()`. Like
  `new X()` in JS or `X()` in Swift. Objects that aren't nodes don't live in
  the scene tree and aren't drawn.
- **Node** — The smallest building block in Godot. Each node does one job
  (draw a shape, play a sound, hold a camera). Like a built-in element such
  as `<div>` or `<input>`, or a `UIView` in UIKit.
- **Node2D** — The basic node for 2D things. Has a position, rotation and
  scale. Children move with their parent.
- **`$NodeName`** — Shorthand for "my child node with this name," e.g.
  `$Room`. Like a React `ref` or a UIKit `@IBOutlet`.
- **`null`** — "Nothing." A variable that could hold an object but
  currently doesn't. Like `nil` in Swift or `null` in JS.
- **`@onready`** — Fills in a variable just before `_ready()` runs, when
  child nodes exist. Used with `$`: `@onready var room: Room = $Room`.
- **Play (▶)** — Runs the game in a new window. ⌘B on Mac (F5 elsewhere);
  ⌘R runs only the open scene; ⌘. stops. No terminal or dev server.
- **`pop_front()`** — Removes and returns the first item of an array. Like
  JS `shift()`.
- **Position (local)** — A node's position is relative to its parent, not
  the screen. Move the parent and all children move with it.
- **`_process(delta)`** — Called by Godot on every node, once per frame.
  Where continuous things like movement happen.
- **Project Manager** — The launcher window Godot shows first, listing your
  projects. Not the editor itself.
- **`project.godot`** — The file that makes a folder a Godot project. Holds
  project settings (name, window size, main scene). Like `package.json`.
- **`queue_redraw()`** — Asks Godot to run a node's `_draw()` again next
  frame. Changing a variable does *not* redraw on its own (unlike React).
- **Radians / `TAU`** — Godot measures angles in radians, not degrees.
  `TAU` (≈ 6.28) is a full circle; `TAU / 2` is half.
- **`_ready()`** — Called once when a node (and all its children) has been
  added to the running game. Like `useEffect(() => {}, [])` or
  `viewDidLoad`.
- **Rect2 / Rect2i / Vector2 / Vector2i** — Built-in types. `Vector2` is an
  (x, y) pair of decimals (pixels); `Vector2i` is an (x, y) pair of whole
  numbers (tile coordinates). `Rect2` is a rectangle: position + size;
  `Rect2i` is the whole-number version. `has_point()` asks "is this inside?"
- **`res://`** — "The root of this project." Godot's paths start here, e.g.
  `res://scenes/main.tscn`.
- **Scene** — A saved, reusable tree of nodes. Can be any size: a single
  crew member, a room, a whole ship. Scenes nest inside other scenes, like
  React components. Unlike React, nodes are long-lived objects you change
  directly (`crew.position = ...`), not re-rendered from state. Not every
  node needs its own scene; one-off nodes (like `Floorplan`) just live
  inside a scene.
- **Scene panel** — Top-left in the editor. Shows the node tree of the open
  scene, like Xcode's view hierarchy. Drop a script on a node here to
  attach it.
- **Selection state** — Which object the player has picked. Kept in one
  place (the floorplan's `selected_crew`) since only one can be selected.
- **Setter (`set(value):`)** — Code that runs whenever a variable is
  assigned. Like Swift's `didSet`. We use it to redraw on change.
- **`signi()`** — Turns a whole number into -1, 0 or 1 depending on its
  sign. `signi(-3)` → `-1`.
- **`slice(n)`** — Returns a copy of an array from index `n` onward. Like
  JS `.slice(n)`.
- **Solid tile** — A tile the pathfinder may not step on (walls, empty
  space).
- **Station** — Our theme-agnostic name for a spot where crew do work
  (a generator, a barricade, a helm…). Has health; crew repair it.
- **Tile** — One square cell of a grid. Game logic thinks in tiles
  (`(2, 3)`); drawing thinks in pixels (`(120, 168)`). Converting between
  the two is a constant job.
- **`.tscn` file** — A saved scene ("text scene"). Plain text, so it diffs
  nicely in git. If it changes outside the editor, use
  Scene → Reload Saved Scene to see the change.
- **Typed array** — `Array[Vector2i]`: a list that may only hold one type.
  Like `[Vector2i]` in Swift or `Vector2i[]` in TypeScript.
- **`.uid` file** — Sidecar file Godot creates next to each script, giving
  it a permanent ID so references survive renames. Committed to git.
- **`_unhandled_input(event)`** — Called by Godot for each input event that
  no UI element used up. Where game clicks and key presses are handled.
- **`_unused` (leading underscore)** — Prefixing a parameter with `_`
  (e.g. `_delta`) says "I'm not using this," which silences a warning.
- **Viewport** — The area the game draws into. Its size is set in
  `project.godot` (we use 1280×720).
- **`visible` / `show()` / `hide()`** — Every node can be hidden without
  being removed, like CSS `display: none`. Hidden nodes (and their
  children) aren't drawn.

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

### Step 3 — Right-click a tile and the character walks there

- Running the game: ▶ / ⌘B in the editor. Tiles count from `(0, 0)` at
  the top-left, and y grows *downward*.
- `Floorplan` got a script and became the **coordinator**: it listens for
  right-clicks in `_unhandled_input`, converts the mouse position to a tile
  (`pixels_to_tile` = divide by tile size, round down), checks the tile is
  in the room (`has_tile`), and orders the crew member to `walk_to` it.
- Movement lives in `_process(delta)`, which runs every frame. The crew
  member slides toward the center of its current tile with `move_toward`;
  once centered, if it's not at the target, it claims the next tile (x
  first, then y — an L-shaped path, to be replaced by pathfinding).
- `tile_position` is the tile being stood on *or entered*; `target_tile` is
  where it was ordered to go. Clicking mid-walk just changes the target.
- Editor lessons: the **FileSystem** panel is files on disk; the **Scene**
  panel is the node tree. `.tscn` files are text, and the editor doesn't
  notice outside edits until you reload the scene.

### Step 4 — A second room connected by a door

- Tiles now count from the **Floorplan's** top-left, not each room's. Each
  room has a `grid_position` (RoomA at `(0, 0)`, RoomB at `(6, 0)`) and
  moves itself there in `_ready`.
- A `Door` is its own small scene: one walkable tile between the rooms.
- `Floorplan.is_walkable` loops over its children and asks each Room or
  Door `has_tile`. Adding a room needs no code change.
- **`.tscn` vs `.gd`:** the scene says *what exists* and its values; the
  script says *how it behaves*. A script does nothing until attached.
- **Looks vs logic:** the door is one whole tile for walking, but `_draw`
  paints only a thin bar — like a hit area bigger than the icon.
  `door_width` and colors are `@export`ed so they can be tuned per door.
- Known gap: the simple "across, then up/down" walk can cut through
  walls. Pathfinding (Step 5) fixes it.

### Step 5 — Pathfinding through the door with `AStarGrid2D`

- **A\*** finds the shortest route by exploring the most promising tiles
  first (steps so far + guess of steps left). Godot's `AStarGrid2D` does
  it for us.
- `Floorplan` builds the pathfinder once in `_ready`: set the region
  (`grid_size`, 11×5), no diagonals, `update()`, then mark every tile that
  isn't a room or door as **solid** (reusing `is_walkable`).
- On right-click, `get_id_path(from, to)` returns the route as a list of
  tiles. `slice(1)` drops the first tile (where the crew member stands).
- `CrewMember` got simpler: it holds a typed array `path` and, each time
  it's centered on a tile, `pop_front()`s the next one. The floorplan gives
  directions; the crew member drives.
- A crew member starting outside the grid breaks pathfinding, so starting
  tiles must be inside a room.

### Step 6a — Two crew members: left-click to select, right-click to move

- A second `crew_member.tscn` instance, with its own color override.
- `Floorplan` owns the **selection state**: `selected_crew`, a crew member
  or `null`. Left-click selects whatever circle is under the mouse (a hit
  test using `distance_to` and `radius`); clicking empty floor deselects.
  Right-click moves only the selected crew member.
- The green ring is drawn with `draw_arc` when `is_selected` is true.
  `is_selected` has a **setter** that calls `queue_redraw()`, because Godot
  doesn't redraw just because a variable changed.

### Step 6b — Highlight the destination tile

- `TileHighlight` is its own node, placed in the tree **between the rooms
  and the crew** so it draws above the floor and below the circles. It
  draws its translucent square once; after that we only move it and
  `show()`/`hide()` it.
- `CrewMember` answers two questions: `is_walking()` and `destination()`
  (the last tile of its path, via `back()`).
- `Floorplan._process` re-decides every frame: if the selected crew member
  is walking, highlight its destination, otherwise hide. Deriving it fresh
  each frame (like rendering from state in React) means arriving,
  deselecting, rerouting and switching selection all just work.

### Step 6c — A wall the pathfinder goes around

- `Wall` is its own scene, like `Door`, but with a `size_in_tiles` so one
  node can cover several tiles. It's a blocking fixture without art.
- `is_walkable` now means "on a room or door tile **and not** on a wall."
  It can't return early on finding floor (a wall might come later in the
  child list), so it remembers `on_floor` and lets any wall win.
- Nothing else changed: the pathfinder already marks every non-walkable
  tile solid, so it routes around the wall automatically, and right-clicks
  on the wall are ignored.

### Milestone 1 complete

Two rooms joined by a door, a wall, two selectable crew members, and
A\* pathfinding with a destination highlight. Key ideas so far: scenes vs
scripts, tiles vs pixels, the game loop (`_process`), draw order, and
keeping looks separate from logic.

## Milestone 2

### Step 7a — A station with a health bar

- `Station` is its own scene: one tile, drawn as an inset square, with a
  health bar floating just above (negative y = above the node).
- `health` has a **setter** that clamps it to `0..max_health` and calls
  `queue_redraw()`, so anything can change health and the bar follows.
- The bar is two rectangles: a dark full-width background, then green at
  `width × health / max_health` on top.
- Stations aren't walls, so crew can stand on them.
