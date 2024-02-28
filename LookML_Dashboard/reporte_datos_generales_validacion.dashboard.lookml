---
- dashboard: reporte_datos_generales_validacin
  title: Reporte Datos Generales (Validación)
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  refresh: 1 hour
  preferred_slug: Iz4DHG8V3iThuRbXx8Reow
  elements:
  - title: Tabla de campos y datos contenidos en la vista
    name: Tabla de campos y datos contenidos en la vista
    model: cadena_suministro
    explore: val_vw_datos_generales
    type: looker_grid
    fields: [val_vw_datos_generales.tipo_material, val_vw_datos_generales.unidad_medida,
      val_vw_datos_generales.grupo_articulos, val_vw_datos_generales.grupo_articulos_externos,
      val_vw_datos_generales.Total_stock_libre_utilizacion, val_vw_datos_generales.material,
      val_vw_datos_generales.material_desc, val_vw_datos_generales.centro, val_vw_datos_generales.almacen]
    sorts: [val_vw_datos_generales.Total_stock_libre_utilizacion desc 0]
    limit: 5000
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '10'
    rows_font_size: '10'
    conditional_formatting_include_totals: true
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    show_sql_query_menu_options: false
    pinned_columns:
      "$$$_row_numbers_$$$": left
      val_vw_datos_generales.grupo_articulos: left
      val_vw_datos_generales.grupo_articulos_externos: left
      val_vw_datos_generales.material: left
      val_vw_datos_generales.material_desc: left
    column_order: ["$$$_row_numbers_$$$", val_vw_datos_generales.grupo_articulos,
      val_vw_datos_generales.grupo_articulos_externos, val_vw_datos_generales.material,
      val_vw_datos_generales.material_desc, val_vw_datos_generales.tipo_material,
      val_vw_datos_generales.unidad_medida, val_vw_datos_generales.centro, val_vw_datos_generales.almacen,
      val_vw_datos_generales.Total_stock_libre_utilizacion]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_column_widths:
      val_vw_datos_generales.tipo_material: 100
      val_vw_datos_generales.unidad_medida: 100
      val_vw_datos_generales.grupo_articulos_externos: 150
      val_vw_datos_generales.grupo_articulos: 90
    series_cell_visualizations:
      val_vw_datos_generales.Total_stock_libre_utilizacion:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    conditional_formatting: []
    defaults_version: 1
    refresh: 1 hour
    listen:
      Material Desc: val_vw_datos_generales.material_desc
      Grupo Articulos: val_vw_datos_generales.grupo_articulos
      Centro: val_vw_datos_generales.centro
      Almacen: val_vw_datos_generales.almacen
      Grupo Articulos Externos: val_vw_datos_generales.grupo_articulos_externos
      Material: val_vw_datos_generales.material
      Tipo Stock: val_vw_datos_generales.Tipo_Stock
    row: 2
    col: 3
    width: 21
    height: 12
  - title: Sku Invetario
    name: Sku Invetario
    model: cadena_suministro
    explore: val_vw_datos_generales
    type: single_value
    fields: [val_vw_datos_generales.Total_inventario]
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
    custom_color: "#cc2634"
    single_value_title: SKU Sin Inventario
    conditional_formatting: [{type: greater than, value: 0, background_color: "#5D6D7E",
        font_color: "#fff", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    value_labels: legend
    label_type: labPer
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
    show_null_points: true
    interpolation: linear
    listen:
      Material Desc: val_vw_datos_generales.material_desc
      Grupo Articulos: val_vw_datos_generales.grupo_articulos
      Centro: val_vw_datos_generales.centro
      Almacen: val_vw_datos_generales.almacen
      Grupo Articulos Externos: val_vw_datos_generales.grupo_articulos_externos
      Material: val_vw_datos_generales.material
      Tipo Stock: val_vw_datos_generales.Tipo_Stock
    row: 6
    col: 0
    width: 3
    height: 2
  - title: Total centros
    name: Total centros
    model: cadena_suministro
    explore: val_vw_datos_generales
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
    single_value_title: Número Centros
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#5D6D7E",
        font_color: "#fff", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    value_labels: legend
    label_type: labPer
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
    show_null_points: true
    interpolation: linear
    listen:
      Material Desc: val_vw_datos_generales.material_desc
      Grupo Articulos: val_vw_datos_generales.grupo_articulos
      Centro: val_vw_datos_generales.centro
      Almacen: val_vw_datos_generales.almacen
      Grupo Articulos Externos: val_vw_datos_generales.grupo_articulos_externos
      Material: val_vw_datos_generales.material
      Tipo Stock: val_vw_datos_generales.Tipo_Stock
    row: 10
    col: 0
    width: 3
    height: 2
  - title: Total Sku
    name: Total Sku
    model: cadena_suministro
    explore: val_vw_datos_generales
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
    single_value_title: Número Sku
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#5D6D7E",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    value_labels: legend
    label_type: labPer
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
    show_null_points: true
    interpolation: linear
    listen:
      Material Desc: val_vw_datos_generales.material_desc
      Grupo Articulos: val_vw_datos_generales.grupo_articulos
      Centro: val_vw_datos_generales.centro
      Almacen: val_vw_datos_generales.almacen
      Grupo Articulos Externos: val_vw_datos_generales.grupo_articulos_externos
      Material: val_vw_datos_generales.material
      Tipo Stock: val_vw_datos_generales.Tipo_Stock
    row: 2
    col: 0
    width: 3
    height: 2
  - title: Sku Invetario (Copy)
    name: Sku Invetario (Copy)
    model: cadena_suministro
    explore: val_vw_datos_generales
    type: single_value
    fields: [val_vw_datos_generales.Total_Sin_inventario]
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
    custom_color: "#12B5CB"
    single_value_title: SKU con Inventario
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#5D6D7E",
        font_color: "#fff", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    value_labels: legend
    label_type: labPer
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
    show_null_points: true
    interpolation: linear
    listen:
      Material Desc: val_vw_datos_generales.material_desc
      Grupo Articulos: val_vw_datos_generales.grupo_articulos
      Centro: val_vw_datos_generales.centro
      Almacen: val_vw_datos_generales.almacen
      Grupo Articulos Externos: val_vw_datos_generales.grupo_articulos_externos
      Material: val_vw_datos_generales.material
      Tipo Stock: val_vw_datos_generales.Tipo_Stock
    row: 4
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
  - title: Lista Almacenes  inventario
    name: Lista Almacenes  inventario
    model: cadena_suministro
    explore: val_vw_datos_generales
    type: looker_column
    fields: [val_vw_datos_generales.almacen, val_vw_datos_generales.Total_stock_libre_utilizacion]
    filters:
      val_vw_datos_generales.Total_stock_libre_utilizacion: ">0"
    sorts: [val_vw_datos_generales.Total_stock_libre_utilizacion desc]
    limit: 80
    column_limit: 50
    dynamic_fields:
    - measure: count_of_num_reserva
      based_on: val_vw_datos_generales.num_reserva
      expression: ''
      label: Count of Num Reserva
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - measure: count_of_material
      based_on: val_vw_datos_generales.material
      expression: ''
      label: Count of Material
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      count_of_material: "#80868B"
      val_vw_datos_generales.Total_stock_libre_utilizacion: "#80868B"
    series_labels:
      count_of_num_reserva: "# Reservas"
      val_vw_datos_generales.material: Material
      val_vw_datos_generales.texto_breve_material: Descripción
      val_vw_datos_generales.unidad_medida: UM
      val_vw_datos_generales.tipo_material: Tipo material
      count_of_material: "# de SKU's"
      val_vw_datos_generales.grupo_articulos: Grupo de Artículos
      val_vw_datos_generales.centro: Centro
      val_vw_datos_generales.almacen: Almacén
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 120
    series_column_widths:
      val_vw_datos_generales.almacen: 120
    series_cell_visualizations:
      count_of_num_reserva:
        is_active: true
    defaults_version: 1
    hidden_pivots: {}
    refresh: 1 hour
    listen:
      Material Desc: val_vw_datos_generales.material_desc
      Grupo Articulos: val_vw_datos_generales.grupo_articulos
      Centro: val_vw_datos_generales.centro
      Almacen: val_vw_datos_generales.almacen
      Grupo Articulos Externos: val_vw_datos_generales.grupo_articulos_externos
      Material: val_vw_datos_generales.material
      Tipo Stock: val_vw_datos_generales.Tipo_Stock
    row: 22
    col: 12
    width: 12
    height: 9
  - title: Lista centro inventario
    name: Lista centro inventario
    model: cadena_suministro
    explore: val_vw_datos_generales
    type: looker_column
    fields: [val_vw_datos_generales.centro, val_vw_datos_generales.Total_stock_libre_utilizacion]
    filters:
      val_vw_datos_generales.Total_stock_libre_utilizacion: ">0"
    sorts: [val_vw_datos_generales.Total_stock_libre_utilizacion desc 0]
    limit: 80
    column_limit: 50
    dynamic_fields:
    - measure: count_of_num_reserva
      based_on: val_vw_datos_generales.num_reserva
      expression: ''
      label: Count of Num Reserva
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - measure: count_of_material
      based_on: val_vw_datos_generales.material
      expression: ''
      label: Count of Material
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      count_of_material: "#C70039"
      val_vw_datos_generales.Total_stock_libre_utilizacion: "#C70039"
    series_labels:
      count_of_num_reserva: "# Reservas"
      val_vw_datos_generales.material: Material
      val_vw_datos_generales.texto_breve_material: Descripción
      val_vw_datos_generales.unidad_medida: UM
      val_vw_datos_generales.tipo_material: Tipo material
      count_of_material: "# de SKU's"
      val_vw_datos_generales.grupo_articulos: Grupo de Artículos
      val_vw_datos_generales.centro: Centro
      val_vw_datos_generales.almacen: Almacén
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 120
    series_cell_visualizations:
      count_of_num_reserva:
        is_active: true
    defaults_version: 1
    hidden_pivots: {}
    refresh: 1 hour
    listen:
      Material Desc: val_vw_datos_generales.material_desc
      Grupo Articulos: val_vw_datos_generales.grupo_articulos
      Centro: val_vw_datos_generales.centro
      Almacen: val_vw_datos_generales.almacen
      Grupo Articulos Externos: val_vw_datos_generales.grupo_articulos_externos
      Material: val_vw_datos_generales.material
      Tipo Stock: val_vw_datos_generales.Tipo_Stock
    row: 22
    col: 0
    width: 12
    height: 9
  - title: Sku Invetario (Copy 3)
    name: Sku Invetario (Copy 3)
    model: cadena_suministro
    explore: val_vw_datos_generales
    type: single_value
    fields: [val_vw_datos_generales.Total_stock_libre_utilizacion]
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
    custom_color: "#12B5CB"
    single_value_title: Total Inventario
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#5D6D7E",
        font_color: "#fff", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    value_labels: legend
    label_type: labPer
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
    show_null_points: true
    interpolation: linear
    listen:
      Material Desc: val_vw_datos_generales.material_desc
      Grupo Articulos: val_vw_datos_generales.grupo_articulos
      Centro: val_vw_datos_generales.centro
      Almacen: val_vw_datos_generales.almacen
      Grupo Articulos Externos: val_vw_datos_generales.grupo_articulos_externos
      Material: val_vw_datos_generales.material
      Tipo Stock: val_vw_datos_generales.Tipo_Stock
    row: 8
    col: 0
    width: 3
    height: 2
  - title: Sku Invetario (Copy 2)
    name: Sku Invetario (Copy 2)
    model: cadena_suministro
    explore: val_vw_datos_generales
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
    custom_color: "#12B5CB"
    single_value_title: Almacenes
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#5D6D7E",
        font_color: "#fff", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    value_labels: legend
    label_type: labPer
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
    show_null_points: true
    interpolation: linear
    listen:
      Material Desc: val_vw_datos_generales.material_desc
      Grupo Articulos: val_vw_datos_generales.grupo_articulos
      Centro: val_vw_datos_generales.centro
      Almacen: val_vw_datos_generales.almacen
      Grupo Articulos Externos: val_vw_datos_generales.grupo_articulos_externos
      Material: val_vw_datos_generales.material
      Tipo Stock: val_vw_datos_generales.Tipo_Stock
    row: 12
    col: 0
    width: 3
    height: 2
  - title: Tipos stock
    name: Tipos stock
    model: cadena_suministro
    explore: val_vw_datos_generales
    type: looker_column
    fields: [val_vw_datos_generales.Total_stock_control_calidad, val_vw_datos_generales.Total_stock_libre,
      val_vw_datos_generales.Total_stock_seguridad, val_vw_datos_generales.Total_stock_seguridad_min,
      val_vw_datos_generales.Total_stock_traslado]
    sorts: [val_vw_datos_generales.Total_stock_control_calidad desc 0]
    limit: 5000
    column_limit: 50
    total: true
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
      palette_id: c36094e3-d04d-4aa4-8ec7-bc9af9f851f4
      options:
        steps: 5
    x_axis_label: Stock
    x_axis_zoom: true
    y_axis_zoom: false
    series_colors: {}
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '10'
    rows_font_size: '10'
    conditional_formatting_include_totals: true
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      "$$$_row_numbers_$$$": left
      val_vw_datos_generales.grupo_articulos: left
      val_vw_datos_generales.grupo_articulos_externos: left
      val_vw_datos_generales.material: left
      val_vw_datos_generales.material_desc: left
    column_order: ["$$$_row_numbers_$$$", val_vw_datos_generales.grupo_articulos,
      val_vw_datos_generales.grupo_articulos_externos, val_vw_datos_generales.material,
      val_vw_datos_generales.material_desc, val_vw_datos_generales.tipo_material,
      val_vw_datos_generales.unidad_medida, val_vw_datos_generales.centro, val_vw_datos_generales.almacen,
      val_vw_datos_generales.Total_stock_libre_utilizacion]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      val_vw_datos_generales.Total_stock_libre_utilizacion:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    conditional_formatting: []
    defaults_version: 1
    hidden_pivots: {}
    refresh: 1 hour
    listen:
      Material Desc: val_vw_datos_generales.material_desc
      Grupo Articulos: val_vw_datos_generales.grupo_articulos
      Centro: val_vw_datos_generales.centro
      Almacen: val_vw_datos_generales.almacen
      Grupo Articulos Externos: val_vw_datos_generales.grupo_articulos_externos
      Material: val_vw_datos_generales.material
      Tipo Stock: val_vw_datos_generales.Tipo_Stock
    row: 14
    col: 0
    width: 24
    height: 8
  filters:
  - name: Grupo Articulos
    title: Grupo Articulos
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: cadena_suministro
    explore: val_vw_datos_generales
    listens_to_filters: [Grupo Articulos Externos, Almacen, Centro]
    field: val_vw_datos_generales.grupo_articulos
  - name: Grupo Articulos Externos
    title: Grupo Articulos Externos
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cadena_suministro
    explore: val_vw_datos_generales
    listens_to_filters: [Grupo Articulos, Almacen, Centro]
    field: val_vw_datos_generales.grupo_articulos_externos
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
    explore: val_vw_datos_generales
    listens_to_filters: [Grupo Articulos, Grupo Articulos Externos, Almacen, Centro]
    field: val_vw_datos_generales.material
  - name: Material Desc
    title: Material Desc
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: cadena_suministro
    explore: val_vw_datos_generales
    listens_to_filters: [Grupo Articulos, Grupo Articulos Externos, Centro]
    field: val_vw_datos_generales.material_desc
  - name: Almacen
    title: Almacen
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: cadena_suministro
    explore: val_vw_datos_generales
    listens_to_filters: [Grupo Articulos, Grupo Articulos Externos, Centro]
    field: val_vw_datos_generales.almacen
  - name: Centro
    title: Centro
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: cadena_suministro
    explore: val_vw_datos_generales
    listens_to_filters: [Grupo Articulos, Grupo Articulos Externos, Almacen]
    field: val_vw_datos_generales.centro
  - name: Tipo Stock
    title: Tipo Stock
    type: field_filter
    default_value: stock^_seguridad
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: cadena_suministro
    explore: val_vw_datos_generales
    listens_to_filters: []
    field: val_vw_datos_generales.Tipo_Stock
