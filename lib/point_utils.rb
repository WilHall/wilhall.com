class PointUtils
  POINT_TYPES = [
    "digital_stone",
    "digital_import",
    "digital_design",
    "digital_prep",
    "essix",
    "prep",
    "machine_bend",
    "metal_prep",
    "bend",
    "weld",
    "acrylic",
    "grind",
    "finishing",
    "qc"
  ].freeze

  POINT_TYPE_ICONS = {
    digital_stone: "fa-hill-rockslide",
    digital_import: "fa-file-import",
    digital_design: "fa-computer",
    digital_prep: "fa-cube",
    essix: "fa-teeth-open",
    prep: "fa-teeth",
    machine_bend: "fa-toolbox",
    metal_prep: "fa-guitar",
    bend: "fa-wrench",
    weld: "fa-explosion",
    acrylic: "fa-pump-soap",
    grind: "fa-gears",
    finishing: "fa-broom",
    qc: "fa-clipboard-check"
  }.stringify_keys.freeze

  POINT_TYPE_PRODUCTION_STEPS = {
    digital_stone: ["Pour Model", "Scan Model", "Pre Articulate", "Articulate"].freeze,
    digital_import: ["Digital Import"].freeze,
    digital_design: ["Digital Reset", "CAD Design", "Pontic Design"].freeze,
    digital_prep: ["Digital Base", "Digital Prep"].freeze,
    essix: ["Essix Prep", "24HRE Biostar/Finish", "BioStar / Finish", "Mouthguard", "FLR Clear Jig", "Cut - Finish 2nd Set"].freeze,
    prep: ["Banding", "Fixed Prep", "Removable Prep"].freeze,
    machine_bend: ["AOS Design Fixed", "AOS Design Removable"].freeze,
    metal_prep: ["3D Metal Check"].freeze,
    bend: ["Cut Pontic", "Bend FLR", "Bend Fixed", "Bend Fixed Aux", "Bend Removable", "Bend Removable Aux", "Fixed/Removable Assembly", "Bend Crib", "Fixed Wax-Up", "Removable Wax-Up"].freeze,
    weld: ["Weld Attachments (Pre)", "Laser Weld / Solder", "Weld Attachments (Post)", "Weld Crib"].freeze,
    acrylic: ["Acrylic"].freeze,
    grind: ["Pre-Grind", "Grind"].freeze,
    finishing: ["Finishing", "3D Splint Finish"].freeze,
    qc: ["QC / Shipping"].freeze
  }.stringify_keys.freeze
end