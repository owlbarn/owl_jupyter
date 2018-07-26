(*
 * OWL - an OCaml numerical library for scientific computing
 * Copyright (c) 2016-2018 Liang Wang <liang.wang@cl.cam.ac.uk>
 *)

include Owl_plot


let output h =
  let temp_plot = Filename.temp_file "plot_" ".png" in
  set_output h temp_plot;
  output h;
  let plot_str = Owl_io.read_file_string temp_plot in
  Jupyter_notebook.display ~base64:true "image/png" plot_str
