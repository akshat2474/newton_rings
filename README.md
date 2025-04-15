# Newton's Rings Simulation

This MATLAB script simulates **Newton’s Rings** — a classic interference pattern created by the reflection of light between two surfaces, typically a plano-convex lens and a flat glass surface.

It also optionally simulates:
- A **surface defect**, modeled as a bump in the lens.
- A **thin film layer**, which alters the fringe pattern.

## 🧠 Concepts Involved

- **Interference of light**
- **Thin film interference**
- **Phase difference and intensity calculation**
- **Optical path differences**
- **Theoretical prediction of fringe radii**

---

## 📊 Simulation Parameters

| Parameter            | Description                                        | Default Value     |
|---------------------|----------------------------------------------------|-------------------|
| `R`                 | Radius of curvature of the lens                    | `2000 mm`         |
| `lambda`            | Wavelength of light                                | `589e-6 mm`       |
| `size_x`, `size_y`  | Grid size (pixels)                                 | `1000 x 1000`     |
| `scale`             | Pixel scale in mm                                  | `0.01 mm`         |
| `max_radius`        | Max radius for theoretical rings display           | `5 mm`            |
| `surface_defect`    | Toggle for surface defect simulation               | `false`           |
| `thin_film`         | Toggle for thin film simulation                    | `false`           |

---

## 📌 Features

- Simulates circular interference rings caused by monochromatic light.
- Allows simulation of defects like bumps on the lens surface.
- Models the effect of an added thin film (e.g., to simulate air gaps or coatings).
- Overlays theoretical ring radii for validation.
- Displays intensity cross-section when thin film is enabled.

---

## 📈 Output

1. **Newton's Rings Visualization**  
   A grayscale image showing the ring pattern, with optional annotations for theoretical rings.

2. **Cross-Section Plot** (only if `thin_film = true`)  
   Shows the intensity along a horizontal slice, useful for visualizing fringe shifts.

3. **Command Line Output**  
   Displays theoretical radii of rings and thin film data (if applicable).

---

## ▶️ How to Run

1. Open the script in MATLAB.
2. Set the parameters at the top to customize the simulation.
3. Run the script using the MATLAB Run button or `F5`.

---

## 🧪 Example Use Cases

- **Physics education demos**
- **Optics research visualizations**
- **Studying fringe pattern distortions due to defects or films**

---

## 🔧 Customization Tips

- To enable surface defect simulation:
  ```matlab
  surface_defect = true;
  ```

- To simulate a thin film:
  ```matlab
  thin_film = true;
  ```

- Adjust `defect_size`, `film_thickness`, etc., to explore their effects.

---

## 📜 License

MIT License. Feel free to use, modify, and distribute.

---

## 👨‍🔬 Author

**Akshat Singh**  
