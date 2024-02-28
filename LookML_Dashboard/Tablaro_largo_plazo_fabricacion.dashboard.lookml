---
- dashboard: tablero_largo_plazo_fabricacin
  title: Tablero Largo Plazo (Fabricación)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: p5GAD48rDQEjfF0sDy02N9
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"border-radius: 5px; padding: 5px 10px; background: #154360;\
      \ height: 60px; color: red;\">\n\t<nav style=\"font-size: 18px;\">\n\t\t<img\
      \ style=\"color: #efefef; padding: 5px 15px; float: left; height: 40px;\" src=\"\
      https://wwwstatic.lookercdn.com/logos/looker_all_white.svg\"/>\n\t\t<a style=\"\
      color: #efefef; padding: 5px 15px; float: left; line-height: 40px; font-weight:\
      \ bold;\" >CADENA DE SUMINISTRO</a>\n\t\t\n\t\t\n\t</nav>\n</div>"
    row: 0
    col: 0
    width: 24
    height: 2
  - title: New Tile
    name: New Tile
    model: cadena_suministro
    explore: vw_largo_plazo_cfabricacion
    type: single_value
    fields: [vw_largo_plazo_cfabricacion.Total_sku]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Numero SKU
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#5D6D7E",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Centro: vw_largo_plazo_cfabricacion.centro
      Material: vw_largo_plazo_cfabricacion.sku
      Tipo Escenario: vw_largo_plazo_cfabricacion.tipo_escenario
    row: 2
    col: 0
    width: 3
    height: 2
  - title: Fabricación
    name: Fabricación
    model: cadena_suministro
    explore: vw_largo_plazo_cfabricacion
    type: looker_grid
    fields: [vw_largo_plazo_cfabricacion.concepto, vw_largo_plazo_cfabricacion.Total_cantidad,
      vw_largo_plazo_cfabricacion.periodo, vw_largo_plazo_cfabricacion.orden_concepto]
    pivots: [vw_largo_plazo_cfabricacion.periodo]
    sorts: [vw_largo_plazo_cfabricacion.periodo, vw_largo_plazo_cfabricacion.orden_concepto
        0]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      vw_largo_plazo_cfabricacion.Grupo_linea: left
      vw_largo_plazo_cfabricacion.planta_descrip: left
    column_order: [vw_largo_plazo_cfabricacion.id_concepto, vw_largo_plazo_cfabricacion.orden_concepto,
      vw_largo_plazo_cfabricacion.concepto, 2024-01_vw_largo_plazo_cfabricacion.Total_cantidad,
      2024-02_vw_largo_plazo_cfabricacion.Total_cantidad, 2024-03_vw_largo_plazo_cfabricacion.Total_cantidad,
      2024-04_vw_largo_plazo_cfabricacion.Total_cantidad, 2024-05_vw_largo_plazo_cfabricacion.Total_cantidad,
      2024-06_vw_largo_plazo_cfabricacion.Total_cantidad, 2024-07_vw_largo_plazo_cfabricacion.Total_cantidad,
      2024-08_vw_largo_plazo_cfabricacion.Total_cantidad, 2024-09_vw_largo_plazo_cfabricacion.Total_cantidad,
      2024-10_vw_largo_plazo_cfabricacion.Total_cantidad, 2024-11_vw_largo_plazo_cfabricacion.Total_cantidad,
      2024-12_vw_largo_plazo_cfabricacion.Total_cantidad, 2025-01_vw_largo_plazo_cfabricacion.Total_cantidad,
      2025-02_vw_largo_plazo_cfabricacion.Total_cantidad, 2025-03_vw_largo_plazo_cfabricacion.Total_cantidad,
      2025-04_vw_largo_plazo_cfabricacion.Total_cantidad, 2025-05_vw_largo_plazo_cfabricacion.Total_cantidad,
      2025-06_vw_largo_plazo_cfabricacion.Total_cantidad, 2025-07_vw_largo_plazo_cfabricacion.Total_cantidad,
      2025-08_vw_largo_plazo_cfabricacion.Total_cantidad, 2025-09_vw_largo_plazo_cfabricacion.Total_cantidad,
      2025-10_vw_largo_plazo_cfabricacion.Total_cantidad, 2025-11_vw_largo_plazo_cfabricacion.Total_cantidad,
      2025-12_vw_largo_plazo_cfabricacion.Total_cantidad, 2026-04_vw_largo_plazo_cfabricacion.Total_cantidad,
      2026-05_vw_largo_plazo_cfabricacion.Total_cantidad, 2026-06_vw_largo_plazo_cfabricacion.Total_cantidad,
      2026-07_vw_largo_plazo_cfabricacion.Total_cantidad, 2026-08_vw_largo_plazo_cfabricacion.Total_cantidad,
      2026-09_vw_largo_plazo_cfabricacion.Total_cantidad, 2026-10_vw_largo_plazo_cfabricacion.Total_cantidad,
      2026-11_vw_largo_plazo_cfabricacion.Total_cantidad, 2026-12_vw_largo_plazo_cfabricacion.Total_cantidad,
      2027-01_vw_largo_plazo_cfabricacion.Total_cantidad]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      vw_largo_plazo_cfabricacion.Total_cantidad: Cantidad
      vw_largo_plazo_cfabricacion.planta_descrip: Planta
      vw_largo_plazo_cfabricacion.orden_concepto: ID
    series_cell_visualizations:
      vw_largo_plazo_cfabricacion.Total_cantidad:
        is_active: false
    series_collapsed:
      val_vw_datos_generales.Metaria_descripcion: true
      val_vw_datos_generales.sku_describe: true
      vw_largo_plazo_cfabricacion.planta_descrip: true
      vw_largo_plazo_cfabricacion.concepto: true
      vw_largo_plazo_cfabricacion.Grupo_linea: true
    header_font_color: "#ffff"
    header_background_color: "#154360"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields:
    listen:
      Centro: vw_largo_plazo_cfabricacion.centro
      Material: vw_largo_plazo_cfabricacion.sku
      Tipo Escenario: vw_largo_plazo_cfabricacion.tipo_escenario
    row: 4
    col: 0
    width: 24
    height: 10
  filters:
  - name: Material
    title: Material
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cadena_suministro
    explore: vw_largo_plazo_cfabricacion
    listens_to_filters: []
    field: vw_largo_plazo_cfabricacion.sku
  - name: Centro
    title: Centro
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cadena_suministro
    explore: vw_largo_plazo_cfabricacion
    listens_to_filters: [Material]
    field: vw_largo_plazo_cfabricacion.centro
  - name: Tipo Escenario
    title: Tipo Escenario
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: cadena_suministro
    explore: vw_largo_plazo_cfabricacion
    listens_to_filters: []
    field: vw_largo_plazo_cfabricacion.tipo_escenario
