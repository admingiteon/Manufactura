---
- dashboard: reporte_ordenes_compra_validacin
  title: Reporte Ordenes Compra (Validación)
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  refresh: 1 hour
  preferred_slug: Gy10jUpsptDVFQlLSeYeqX
  elements:
  - title: Tabla de campos y datos contenidos en la vista
    name: Tabla de campos y datos contenidos en la vista
    model: cadena_suministro
    explore: val_vw_ordenes_compra
    type: looker_grid
    fields: [val_vw_ordenes_compra.num_doc_compras, val_vw_ordenes_compra.sociedad,
      val_vw_ordenes_compra.clase_pedido, val_vw_ordenes_compra.num_cuenta_proveedor,
      val_vw_ordenes_compra.num_material, val_vw_ordenes_compra.texto_breve, val_vw_ordenes_compra.centro,
      val_vw_ordenes_compra.grupo_articulos, val_vw_ordenes_compra.plazo_entrega_previsto,
      val_vw_ordenes_compra.unidad_medida_pedido, val_vw_ordenes_compra.fecha_creacion_registro,
      val_vw_ordenes_compra.fecha_entrega_pos, val_vw_ordenes_compra.Total_cant_reparto,
      val_vw_ordenes_compra.Total_cant_entrada_mercancias]
    sorts: [val_vw_ordenes_compra.fecha_entrega_pos desc]
    limit: 5000
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '10'
    rows_font_size: '10'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: legacy
      palette_id: looker_classic
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", val_vw_ordenes_compra.num_doc_compras, val_vw_ordenes_compra.grupo_articulos,
      val_vw_ordenes_compra.num_material, val_vw_ordenes_compra.texto_breve, val_vw_ordenes_compra.sociedad,
      val_vw_ordenes_compra.clase_pedido, val_vw_ordenes_compra.fecha_creacion_registro,
      val_vw_ordenes_compra.fecha_entrega_pos, val_vw_ordenes_compra.num_cuenta_proveedor,
      val_vw_ordenes_compra.centro, val_vw_ordenes_compra.plazo_entrega_previsto,
      val_vw_ordenes_compra.unidad_medida_pedido, val_vw_ordenes_compra.Total_cant_reparto,
      val_vw_ordenes_compra.Total_cant_entrada_mercancias]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      val_vw_ordenes_compra.fecha_entrega_pos: Fecha Entrega
      val_vw_ordenes_compra.fecha_creacion_registro: Fecha Registro
      val_vw_ordenes_compra.Total_cant_reparto: Can Reparto
      val_vw_ordenes_compra.Total_cant_entrada_mercancias: Cant Entrada
      val_vw_ordenes_compra.unidad_medida_pedido: Unidad Medida
      val_vw_ordenes_compra.plazo_entrega_previsto: Plazo
    series_column_widths:
      val_vw_ordenes_compra.texto_breve: 382
      val_vw_ordenes_compra.num_material: 237
      val_vw_ordenes_compra.num_cuenta_proveedor: 245
      val_vw_ordenes_compra.fecha_creacion_registro: 166
      val_vw_ordenes_compra.num_doc_compras: 166
      val_vw_ordenes_compra.fecha_entrega_pos: 176
      val_vw_ordenes_compra.grupo_articulos: 117
    series_cell_visualizations:
      val_vw_ordenes_compra.Total_cant_entrada_mercancias:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Num Material: val_vw_ordenes_compra.num_material
      Num Doc Compras: val_vw_ordenes_compra.num_doc_compras
      Grupo Articulos: val_vw_ordenes_compra.grupo_articulos
      Num Cuenta Proveedor: val_vw_ordenes_compra.num_cuenta_proveedor
      Sociedad: val_vw_ordenes_compra.sociedad
    row: 2
    col: 3
    width: 21
    height: 8
  - title: Lista Sociedades
    name: Lista Sociedades
    model: cadena_suministro
    explore: val_vw_ordenes_compra
    type: looker_column
    fields: [val_vw_ordenes_compra.sociedad, count_of_num_pos_doc_compras]
    sorts: [count_of_num_pos_doc_compras desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_num_pos_doc_compras
      based_on: val_vw_ordenes_compra.num_pos_doc_compras
      expression: ''
      label: Count of Num Pos Doc Compras
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
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels:
      val_vw_ordenes_compra.sociedad: Sociedad
      count_of_num_pos_doc_compras: Docs Compra
    show_dropoff: false
    value_labels: legend
    label_type: labPer
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
    minimum_column_width: 100
    series_column_widths:
      count_of_num_pos_doc_compras: 121
    series_cell_visualizations:
      count_of_num_pos_doc_compras:
        is_active: false
    series_text_format:
      count_of_num_pos_doc_compras:
        align: left
    defaults_version: 1
    listen:
      Num Material: val_vw_ordenes_compra.num_material
      Num Doc Compras: val_vw_ordenes_compra.num_doc_compras
      Grupo Articulos: val_vw_ordenes_compra.grupo_articulos
      Num Cuenta Proveedor: val_vw_ordenes_compra.num_cuenta_proveedor
      Sociedad: val_vw_ordenes_compra.sociedad
    row: 17
    col: 0
    width: 11
    height: 7
  - title: Lista Clase Pedido
    name: Lista Clase Pedido
    model: cadena_suministro
    explore: val_vw_ordenes_compra
    type: looker_column
    fields: [count_of_num_pos_doc_compras, val_vw_ordenes_compra.clase_pedido]
    sorts: [count_of_num_pos_doc_compras desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_num_pos_doc_compras
      based_on: val_vw_ordenes_compra.num_pos_doc_compras
      expression: ''
      label: Count of Num Pos Doc Compras
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
      count_of_num_pos_doc_compras: "#EA4335"
    series_labels:
      val_vw_ordenes_compra.sociedad: Sociedad
      count_of_num_pos_doc_compras: Docs Compra
      val_vw_ordenes_compra.clase_pedido: Clase Pedido
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
    minimum_column_width: 100
    series_column_widths:
      count_of_num_pos_doc_compras: 127
      val_vw_ordenes_compra.clase_pedido: 114
    series_cell_visualizations:
      count_of_num_pos_doc_compras:
        is_active: false
    series_text_format:
      val_vw_ordenes_compra.clase_pedido:
        align: left
      count_of_num_pos_doc_compras:
        align: left
    defaults_version: 1
    listen:
      Num Material: val_vw_ordenes_compra.num_material
      Num Doc Compras: val_vw_ordenes_compra.num_doc_compras
      Grupo Articulos: val_vw_ordenes_compra.grupo_articulos
      Num Cuenta Proveedor: val_vw_ordenes_compra.num_cuenta_proveedor
      Sociedad: val_vw_ordenes_compra.sociedad
    row: 17
    col: 11
    width: 13
    height: 7
  - title: New Tile
    name: New Tile
    model: cadena_suministro
    explore: val_vw_ordenes_compra
    type: single_value
    fields: [val_vw_ordenes_compra.Total_ordenes]
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
    single_value_title: Ordenes Compra
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#80868B",
        font_color: "#fff", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Num Material: val_vw_ordenes_compra.num_material
      Num Doc Compras: val_vw_ordenes_compra.num_doc_compras
      Grupo Articulos: val_vw_ordenes_compra.grupo_articulos
      Num Cuenta Proveedor: val_vw_ordenes_compra.num_cuenta_proveedor
      Sociedad: val_vw_ordenes_compra.sociedad
    row: 2
    col: 0
    width: 3
    height: 2
  - title: New Tile
    name: New Tile (2)
    model: cadena_suministro
    explore: val_vw_ordenes_compra
    type: single_value
    fields: [val_vw_ordenes_compra.Total_proveedores]
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
    single_value_title: Numero Proveedores
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#80868B",
        font_color: "#fff", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Num Material: val_vw_ordenes_compra.num_material
      Num Doc Compras: val_vw_ordenes_compra.num_doc_compras
      Grupo Articulos: val_vw_ordenes_compra.grupo_articulos
      Num Cuenta Proveedor: val_vw_ordenes_compra.num_cuenta_proveedor
      Sociedad: val_vw_ordenes_compra.sociedad
    row: 4
    col: 0
    width: 3
    height: 2
  - title: New Tile
    name: New Tile (3)
    model: cadena_suministro
    explore: val_vw_ordenes_compra
    type: single_value
    fields: [val_vw_ordenes_compra.Total_materiales]
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
    single_value_title: Numero sku
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#80868B",
        font_color: "#fff", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Num Material: val_vw_ordenes_compra.num_material
      Num Doc Compras: val_vw_ordenes_compra.num_doc_compras
      Grupo Articulos: val_vw_ordenes_compra.grupo_articulos
      Num Cuenta Proveedor: val_vw_ordenes_compra.num_cuenta_proveedor
      Sociedad: val_vw_ordenes_compra.sociedad
    row: 6
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
  - title: Top 20 Ordenes
    name: Top 20 Ordenes
    model: cadena_suministro
    explore: val_vw_ordenes_compra
    type: looker_column
    fields: [val_vw_ordenes_compra.num_doc_compras, val_vw_ordenes_compra.Total_cant_reparto,
      val_vw_ordenes_compra.Total_cant_entrada_mercancias, val_vw_ordenes_compra.Diferencia_cant]
    filters:
      val_vw_ordenes_compra.fecha_creacion_orden_year: '2023'
    sorts: [val_vw_ordenes_compra.Diferencia_cant desc]
    limit: 20
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      val_vw_ordenes_compra.Total_cant_reparto: "#EA4335"
      val_vw_ordenes_compra.Total_cant_entrada_mercancias: "#80868B"
    series_labels:
      val_vw_ordenes_compra.Total_cant_reparto: Cantidad Reparto
      val_vw_ordenes_compra.Total_cant_entrada_mercancias: Cantidad entrada
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Numero sku
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#80868B",
        font_color: "#fff", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [val_vw_ordenes_compra.Dieferencia_cant, val_vw_ordenes_compra.Diferencia_cant]
    listen:
      Num Material: val_vw_ordenes_compra.num_material
      Num Doc Compras: val_vw_ordenes_compra.num_doc_compras
      Grupo Articulos: val_vw_ordenes_compra.grupo_articulos
      Num Cuenta Proveedor: val_vw_ordenes_compra.num_cuenta_proveedor
      Sociedad: val_vw_ordenes_compra.sociedad
    row: 10
    col: 0
    width: 24
    height: 7
  filters:
  - name: Grupo Articulos
    title: Grupo Articulos
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cadena_suministro
    explore: val_vw_ordenes_compra
    listens_to_filters: []
    field: val_vw_ordenes_compra.grupo_articulos
  - name: Num Material
    title: Num Material
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cadena_suministro
    explore: val_vw_ordenes_compra
    listens_to_filters: [Grupo Articulos]
    field: val_vw_ordenes_compra.num_material
  - name: Num Doc Compras
    title: Num Doc Compras
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cadena_suministro
    explore: val_vw_ordenes_compra
    listens_to_filters: [Grupo Articulos]
    field: val_vw_ordenes_compra.num_doc_compras
  - name: Num Cuenta Proveedor
    title: Num Cuenta Proveedor
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cadena_suministro
    explore: val_vw_ordenes_compra
    listens_to_filters: []
    field: val_vw_ordenes_compra.num_cuenta_proveedor
  - name: Sociedad
    title: Sociedad
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cadena_suministro
    explore: val_vw_ordenes_compra
    listens_to_filters: []
    field: val_vw_ordenes_compra.sociedad
