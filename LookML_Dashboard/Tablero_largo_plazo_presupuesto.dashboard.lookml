---
- dashboard: tablero_largo_plazo_presupuesto
  title: Tablero Largo Plazo (Presupuesto)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 8cTPU7pxIxW8Aw79bWj7Pr
  elements:
  - title: Costo de Producto
    name: Costo de Producto
    model: cadena_suministro
    explore: vw_largo_plazo_presupuesto
    type: looker_grid
    fields: [vw_largo_plazo_presupuesto.id_concepto, vw_largo_plazo_presupuesto.concepto,
      vw_largo_plazo_presupuesto.periodo, vw_largo_plazo_presupuesto.Total_cantidad]
    pivots: [vw_largo_plazo_presupuesto.periodo]
    sorts: [vw_largo_plazo_presupuesto.periodo, vw_largo_plazo_presupuesto.id_concepto]
    limit: 500
    column_limit: 50
    row_total: right
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
    column_order: [vw_largo_plazo_presupuesto.id_concepto, vw_largo_plazo_presupuesto.concepto,
      2023-11_vw_largo_plazo_presupuesto.Total_cantidad, 2023-12_vw_largo_plazo_presupuesto.Total_cantidad,
      2024-01_vw_largo_plazo_presupuesto.Total_cantidad, 2024-02_vw_largo_plazo_presupuesto.Total_cantidad,
      2024-03_vw_largo_plazo_presupuesto.Total_cantidad, 2024-04_vw_largo_plazo_presupuesto.Total_cantidad,
      2024-05_vw_largo_plazo_presupuesto.Total_cantidad, 2024-06_vw_largo_plazo_presupuesto.Total_cantidad,
      2024-07_vw_largo_plazo_presupuesto.Total_cantidad, 2024-08_vw_largo_plazo_presupuesto.Total_cantidad,
      2024-09_vw_largo_plazo_presupuesto.Total_cantidad, 2024-10_vw_largo_plazo_presupuesto.Total_cantidad,
      2024-11_vw_largo_plazo_presupuesto.Total_cantidad, 2024-12_vw_largo_plazo_presupuesto.Total_cantidad,
      2025-01_vw_largo_plazo_presupuesto.Total_cantidad, 2025-02_vw_largo_plazo_presupuesto.Total_cantidad,
      2025-03_vw_largo_plazo_presupuesto.Total_cantidad, 2025-04_vw_largo_plazo_presupuesto.Total_cantidad,
      2025-05_vw_largo_plazo_presupuesto.Total_cantidad, 2025-06_vw_largo_plazo_presupuesto.Total_cantidad,
      2025-07_vw_largo_plazo_presupuesto.Total_cantidad, 2025-08_vw_largo_plazo_presupuesto.Total_cantidad,
      2025-09_vw_largo_plazo_presupuesto.Total_cantidad, 2025-10_vw_largo_plazo_presupuesto.Total_cantidad,
      2025-11_vw_largo_plazo_presupuesto.Total_cantidad, 2025-12_vw_largo_plazo_presupuesto.Total_cantidad,
      2026-01_vw_largo_plazo_presupuesto.Total_cantidad, 2026-02_vw_largo_plazo_presupuesto.Total_cantidad,
      2026-03_vw_largo_plazo_presupuesto.Total_cantidad, 2026-04_vw_largo_plazo_presupuesto.Total_cantidad,
      2026-05_vw_largo_plazo_presupuesto.Total_cantidad, 2026-06_vw_largo_plazo_presupuesto.Total_cantidad,
      2026-07_vw_largo_plazo_presupuesto.Total_cantidad, 2026-08_vw_largo_plazo_presupuesto.Total_cantidad,
      2026-09_vw_largo_plazo_presupuesto.Total_cantidad, 2026-10_vw_largo_plazo_presupuesto.Total_cantidad,
      2026-11_vw_largo_plazo_presupuesto.Total_cantidad, "$$$_row_total_$$$_vw_largo_plazo_presupuesto.Total_cantidad"]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      vw_largo_plazo_presupuesto.Total_cantidad:
        is_active: false
    series_collapsed:
      vw_largo_plazo_presupuesto.sku_describe: true
    header_font_color: "#fff"
    header_background_color: "#154360"
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields:
    listen:
      Grupoarticulo: vw_largo_plazo_presupuesto.grupoarticulo
      Centro: vw_largo_plazo_presupuesto.centro
      Grupoarticuloexterno: vw_largo_plazo_presupuesto.grupoarticuloexterno
      Material: vw_largo_plazo_presupuesto.sku
    row: 4
    col: 0
    width: 24
    height: 9
  - title: New Tile
    name: New Tile
    model: cadena_suministro
    explore: vw_largo_plazo_presupuesto
    type: single_value
    fields: [vw_largo_plazo_presupuesto.Total_importe_absorbente]
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
    single_value_title: Costo
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#5D6D7E",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_pivots: {}
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    defaults_version: 1
    minimum_column_width: 75
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_cell_visualizations:
      vw_largo_plazo_presupuesto.Total_cantidad:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    listen:
      Grupoarticulo: vw_largo_plazo_presupuesto.grupoarticulo
      Centro: vw_largo_plazo_presupuesto.centro
      Grupoarticuloexterno: vw_largo_plazo_presupuesto.grupoarticuloexterno
      Material: vw_largo_plazo_presupuesto.sku
    row: 2
    col: 9
    width: 3
    height: 2
  - title: New Tile
    name: New Tile (2)
    model: cadena_suministro
    explore: vw_largo_plazo_presupuesto
    type: single_value
    fields: [val_vw_datos_generales.Total_Materiales]
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
    single_value_title: SKU
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#5D6D7E",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_pivots: {}
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    defaults_version: 1
    minimum_column_width: 75
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_cell_visualizations:
      vw_largo_plazo_presupuesto.Total_cantidad:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    listen:
      Grupoarticulo: vw_largo_plazo_presupuesto.grupoarticulo
      Centro: vw_largo_plazo_presupuesto.centro
      Grupoarticuloexterno: vw_largo_plazo_presupuesto.grupoarticuloexterno
      Material: vw_largo_plazo_presupuesto.sku
    row: 2
    col: 0
    width: 3
    height: 2
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
  - title: Temporalidad Ptto
    name: Temporalidad Ptto
    model: cadena_suministro
    explore: vw_largo_plazo_presupuesto
    type: looker_area
    fields: [vw_largo_plazo_presupuesto.Total_importe_absorbente, vw_largo_plazo_presupuesto.periodo,
      vw_largo_plazo_presupuesto.Total_importe_costo]
    filters:
      vw_largo_plazo_presupuesto.Tipo_Ptto: Cantidad
    sorts: [vw_largo_plazo_presupuesto.periodo]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: e34425a5-3228-4f76-b45d-2e7cd13a6766
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors: {}
    ordering: none
    show_null_labels: false
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: SKU
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#5D6D7E",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    defaults_version: 1
    minimum_column_width: 75
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_cell_visualizations:
      vw_largo_plazo_presupuesto.Total_cantidad:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    listen:
      Grupoarticulo: vw_largo_plazo_presupuesto.grupoarticulo
      Centro: vw_largo_plazo_presupuesto.centro
      Grupoarticuloexterno: vw_largo_plazo_presupuesto.grupoarticuloexterno
      Material: vw_largo_plazo_presupuesto.sku
    row: 13
    col: 0
    width: 24
    height: 7
  - title: New Tile (Copy 3)
    name: New Tile (Copy 3)
    model: cadena_suministro
    explore: vw_largo_plazo_presupuesto
    type: single_value
    fields: [val_vw_datos_generales.Total_almacenes]
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
    single_value_title: Almacenes
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#5D6D7E",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_pivots: {}
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    defaults_version: 1
    minimum_column_width: 75
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_cell_visualizations:
      vw_largo_plazo_presupuesto.Total_cantidad:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    listen:
      Grupoarticulo: vw_largo_plazo_presupuesto.grupoarticulo
      Centro: vw_largo_plazo_presupuesto.centro
      Grupoarticuloexterno: vw_largo_plazo_presupuesto.grupoarticuloexterno
      Material: vw_largo_plazo_presupuesto.sku
    row: 2
    col: 6
    width: 3
    height: 2
  - title: New Tile (Copy 2)
    name: New Tile (Copy 2)
    model: cadena_suministro
    explore: vw_largo_plazo_presupuesto
    type: single_value
    fields: [val_vw_datos_generales.Total_centros]
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
    single_value_title: Centros
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#5D6D7E",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_pivots: {}
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    defaults_version: 1
    minimum_column_width: 75
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_cell_visualizations:
      vw_largo_plazo_presupuesto.Total_cantidad:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    listen:
      Grupoarticulo: vw_largo_plazo_presupuesto.grupoarticulo
      Centro: vw_largo_plazo_presupuesto.centro
      Grupoarticuloexterno: vw_largo_plazo_presupuesto.grupoarticuloexterno
      Material: vw_largo_plazo_presupuesto.sku
    row: 2
    col: 3
    width: 3
    height: 2
  filters:
  - name: Material
    title: Material
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: cadena_suministro
    explore: vw_largo_plazo_presupuesto
    listens_to_filters: [Centro, Grupoarticulo, Grupoarticuloexterno]
    field: vw_largo_plazo_presupuesto.sku
  - name: Centro
    title: Centro
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: cadena_suministro
    explore: vw_largo_plazo_presupuesto
    listens_to_filters: [Material, Grupoarticulo, Grupoarticuloexterno]
    field: vw_largo_plazo_presupuesto.centro
  - name: Grupoarticulo
    title: Grupoarticulo
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: cadena_suministro
    explore: vw_largo_plazo_presupuesto
    listens_to_filters: [Material, Centro, Grupoarticuloexterno]
    field: vw_largo_plazo_presupuesto.grupoarticulo
  - name: Grupoarticuloexterno
    title: Grupoarticuloexterno
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cadena_suministro
    explore: vw_largo_plazo_presupuesto
    listens_to_filters: [Material, Centro, Grupoarticulo]
    field: vw_largo_plazo_presupuesto.grupoarticuloexterno
