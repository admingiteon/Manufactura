---
- dashboard: tablero_largo_plazo_trazabilidad
  title: Tablero Largo Plazo (Trazabilidad)
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  refresh: 1 hour
  preferred_slug: 34iqh5FQ2yiRK30Pjdpq8u
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
    explore: vw_largo_plazo_trazabilidad
    type: single_value
    fields: [vw_largo_plazo_trazabilidad.sku_unicos]
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
      Grupo de Artículos: vw_largo_plazo_trazabilidad.grupoarticulo
      Grupo de artículos externo: vw_largo_plazo_trazabilidad.grupoarticuloexterno
      Centro: vw_largo_plazo_trazabilidad.centro
      Periodo: vw_largo_plazo_trazabilidad.periodo
      Material: vw_largo_plazo_trazabilidad.sku
    row: 2
    col: 0
    width: 3
    height: 2
  - title: New Tile
    name: New Tile (2)
    model: cadena_suministro
    explore: vw_largo_plazo_trazabilidad
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
    defaults_version: 1
    listen:
      Grupo de Artículos: vw_largo_plazo_trazabilidad.grupoarticulo
      Grupo de artículos externo: vw_largo_plazo_trazabilidad.grupoarticuloexterno
      Centro: vw_largo_plazo_trazabilidad.centro
      Periodo: vw_largo_plazo_trazabilidad.periodo
      Material: vw_largo_plazo_trazabilidad.sku
    row: 2
    col: 3
    width: 3
    height: 2
  - title: New Tile
    name: New Tile (3)
    model: cadena_suministro
    explore: vw_largo_plazo_trazabilidad
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
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Grupo de Artículos: vw_largo_plazo_trazabilidad.grupoarticulo
      Grupo de artículos externo: vw_largo_plazo_trazabilidad.grupoarticuloexterno
      Centro: vw_largo_plazo_trazabilidad.centro
      Periodo: vw_largo_plazo_trazabilidad.periodo
      Material: vw_largo_plazo_trazabilidad.sku
    row: 2
    col: 6
    width: 3
    height: 2
  - title: New Tile
    name: New Tile (4)
    model: cadena_suministro
    explore: vw_largo_plazo_trazabilidad
    type: single_value
    fields: [vw_largo_plazo_trazabilidad.Detalle_sku]
    filters: {}
    sorts: [vw_largo_plazo_trazabilidad.Detalle_sku]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application: undefined
    custom_color: "#154360"
    single_value_title: SKU
    conditional_formatting: [{type: 'null', value: !!null '', background_color: "#5D6D7E",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    header_font_size: 12
    rows_font_size: 12
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Grupo de Artículos: vw_largo_plazo_trazabilidad.grupoarticulo
      Grupo de artículos externo: vw_largo_plazo_trazabilidad.grupoarticuloexterno
      Centro: vw_largo_plazo_trazabilidad.centro
      Periodo: vw_largo_plazo_trazabilidad.periodo
      Material: vw_largo_plazo_trazabilidad.sku
    row: 2
    col: 9
    width: 5
    height: 2
  - title: Largo Plazo
    name: Largo Plazo
    model: cadena_suministro
    explore: vw_largo_plazo_trazabilidad
    type: looker_grid
    fields: [vw_largo_plazo_trazabilidad.orden_concepto, vw_largo_plazo_trazabilidad.concepto,
      vw_largo_plazo_trazabilidad.Total_cantidad, vw_largo_plazo_trazabilidad.periodo_num]
    pivots: [vw_largo_plazo_trazabilidad.periodo_num]
    filters:
      vw_largo_plazo_trazabilidad.concepto: "-INVENTARIO FINAL (QM)"
    sorts: [vw_largo_plazo_trazabilidad.periodo_num, vw_largo_plazo_trazabilidad.orden_concepto]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression:
      label: Cantidad
      value_format:
      value_format_name:
      based_on: vw_largo_plazo_trazabilidad.cantidad
      _kind_hint: measure
      measure: cantidad
      type: sum
      _type_hint: number
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
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
      vw_largo_plazo_trazabilidad.orden_concepto: left
      vw_largo_plazo_trazabilidad.concepto: left
    column_order: [vw_largo_plazo_trazabilidad.orden_concepto, vw_largo_plazo_trazabilidad.concepto,
      2023-11_vw_largo_plazo_trazabilidad.Total_cantidad, 2023-12_vw_largo_plazo_trazabilidad.Total_cantidad,
      2024-01_vw_largo_plazo_trazabilidad.Total_cantidad, 2024-02_vw_largo_plazo_trazabilidad.Total_cantidad,
      2024-03_vw_largo_plazo_trazabilidad.Total_cantidad, 2024-04_vw_largo_plazo_trazabilidad.Total_cantidad,
      2024-05_vw_largo_plazo_trazabilidad.Total_cantidad, 2024-06_vw_largo_plazo_trazabilidad.Total_cantidad,
      2024-07_vw_largo_plazo_trazabilidad.Total_cantidad, 2024-08_vw_largo_plazo_trazabilidad.Total_cantidad,
      2024-09_vw_largo_plazo_trazabilidad.Total_cantidad, 2024-10_vw_largo_plazo_trazabilidad.Total_cantidad,
      2024-11_vw_largo_plazo_trazabilidad.Total_cantidad, 2024-12_vw_largo_plazo_trazabilidad.Total_cantidad,
      2025-01_vw_largo_plazo_trazabilidad.Total_cantidad, 2025-02_vw_largo_plazo_trazabilidad.Total_cantidad,
      2025-03_vw_largo_plazo_trazabilidad.Total_cantidad, 2025-04_vw_largo_plazo_trazabilidad.Total_cantidad,
      2025-05_vw_largo_plazo_trazabilidad.Total_cantidad, 2025-06_vw_largo_plazo_trazabilidad.Total_cantidad,
      2025-07_vw_largo_plazo_trazabilidad.Total_cantidad, 2025-08_vw_largo_plazo_trazabilidad.Total_cantidad,
      2025-09_vw_largo_plazo_trazabilidad.Total_cantidad, 2025-10_vw_largo_plazo_trazabilidad.Total_cantidad,
      2025-11_vw_largo_plazo_trazabilidad.Total_cantidad, 2025-12_vw_largo_plazo_trazabilidad.Total_cantidad,
      2026-01_vw_largo_plazo_trazabilidad.Total_cantidad, 2026-02_vw_largo_plazo_trazabilidad.Total_cantidad,
      2026-03_vw_largo_plazo_trazabilidad.Total_cantidad, 2026-04_vw_largo_plazo_trazabilidad.Total_cantidad,
      2026-05_vw_largo_plazo_trazabilidad.Total_cantidad, 2026-06_vw_largo_plazo_trazabilidad.Total_cantidad,
      2026-07_vw_largo_plazo_trazabilidad.Total_cantidad, 2026-08_vw_largo_plazo_trazabilidad.Total_cantidad,
      2026-09_vw_largo_plazo_trazabilidad.Total_cantidad, 2026-10_vw_largo_plazo_trazabilidad.Total_cantidad,
      2026-11_vw_largo_plazo_trazabilidad.Total_cantidad]
    show_totals: false
    show_row_totals: false
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      vw_largo_plazo_trazabilidad.articulodescribe: Descripción  del articulo
      vw_largo_plazo_trazabilidad.orden_concepto: Id
    series_column_widths:
      vw_largo_plazo_trazabilidad.concepto: 299
    series_cell_visualizations:
      vw_largo_plazo_trazabilidad.Total_cantidad:
        is_active: false
    series_collapsed:
      vw_largo_plazo_trazabilidad.sku: true
      vw_largo_plazo_trazabilidad.sku_describe: true
    header_font_color: "#FFF"
    header_background_color: "#154360"
    hidden_fields:
    hidden_points_if_no: []
    theme: custom
    customTheme: https://rawcdn.githack.com/oso26098126/look_css/ab328823aa295e4e061da2a5c3aaaa2e23fa71a0/sytle.css
    layout: auto
    minWidthForIndexColumns: false
    headerFontSize: 13
    bodyFontSize: 13
    showTooltip: true
    showHighlight: true
    columnOrder: {}
    rowSubtotals: false
    colSubtotals: false
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: measures
    useViewName: false
    useHeadings: false
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|vw_largo_plazo_trazabilidad.sku_describe: SKU Descripciòn
    label|vw_largo_plazo_trazabilidad.periodo_num: Periodo
    label|vw_largo_plazo_trazabilidad.concepto: Concepto
    heading|vw_largo_plazo_trazabilidad.concepto: Concepto
    hide|vw_largo_plazo_trazabilidad.concepto: false
    subtotalDepth: '1'
    label|vw_largo_plazo_trazabilidad.sku: SKU
    heading|vw_largo_plazo_trazabilidad.sku: SKU
    hide|vw_largo_plazo_trazabilidad.sku: false
    label|vw_largo_plazo_trazabilidad.articulodescribe: Descripción
    heading|vw_largo_plazo_trazabilidad.articulodescribe: ''
    hide|vw_largo_plazo_trazabilidad.articulodescribe: false
    label|cantidadformat: ''
    heading|cantidadformat: ''
    style|cantidadformat: black_red
    reportIn|cantidadformat: '1'
    unit|cantidadformat: ''
    comparison|cantidadformat: no_variance
    switch|cantidadformat: true
    var_num|cantidadformat: true
    var_pct|cantidadformat: false
    label|vw_largo_plazo_trazabilidad.drill01: Drill01
    heading|vw_largo_plazo_trazabilidad.drill01: ''
    hide|vw_largo_plazo_trazabilidad.drill01: true
    label|cantidad: "."
    heading|cantidad: Cant
    style|cantidad: black_red
    reportIn|cantidad: '1'
    unit|cantidad: ''
    comparison|cantidad: no_variance
    switch|cantidad: false
    var_num|cantidad: false
    var_pct|cantidad: false
    label|vw_largo_plazo_trazabilidad.id_concepto: ID Concepto
    heading|vw_largo_plazo_trazabilidad.id_concepto: ''
    hide|vw_largo_plazo_trazabilidad.id_concepto: true
    defaults_version: 1
    hidden_pivots: {}
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
    listen:
      Grupo de Artículos: vw_largo_plazo_trazabilidad.grupoarticulo
      Grupo de artículos externo: vw_largo_plazo_trazabilidad.grupoarticuloexterno
      Centro: vw_largo_plazo_trazabilidad.centro
      Periodo: vw_largo_plazo_trazabilidad.periodo
      Material: vw_largo_plazo_trazabilidad.sku
    row: 6
    col: 0
    width: 24
    height: 12
  - title: New Tile (Copy 2)
    name: New Tile (Copy 2)
    model: cadena_suministro
    explore: vw_largo_plazo_trazabilidad
    type: single_value
    fields: [vw_largo_plazo_trazabilidad.sku_unicos]
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
      Grupo de Artículos: vw_largo_plazo_trazabilidad.grupoarticulo
      Grupo de artículos externo: vw_largo_plazo_trazabilidad.grupoarticuloexterno
      Centro: vw_largo_plazo_trazabilidad.centro
      Periodo: vw_largo_plazo_trazabilidad.periodo
      Material: vw_largo_plazo_trazabilidad.sku
    row: 2
    col: 14
    width: 6
    height: 2
  - title: ''
    name: " (2)"
    model: cadena_suministro
    explore: vw_largo_plazo_trazabilidad
    type: single_value
    fields: [vw_largo_plazo_trazabilidad.sku_describe]
    sorts: [vw_largo_plazo_trazabilidad.sku_describe]
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
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    html_template: '<table style="width: 90.3234%;"> <tbody> <tr> <td style="width:
      10.3079%; background-color: #5D6D7E; padding: 0px; border: none #000000; text-align:
      center;"><span style="color: #ffffff;"><strong><span style="font-size: 15px;
      font-family: Arial, sans-serif;">SKU</span></strong></span><br /><br /> <div
      style="text-align: center;"><span style="color: #ffffff;"><strong><span style="font-size:
      20px; font-family: Arial, sans-serif;">{{ vw_largo_plazo_trazabilidad.sku_describe
      }}</span></strong></span></div> <strong><strong><span style="font-size: 15px;
      font-family: Arial, sans-serif;"><br /></span></strong></strong></td> </tr>
      </tbody> </table>'
    single_value_title: Numero SKU
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#5D6D7E",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    up_color: false
    down_color: false
    total_color: false
    show_value_labels: false
    show_x_axis_ticks: true
    show_x_axis_label: true
    x_axis_scale: auto
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_gridlines: true
    color_application: undefined
    hidden_pivots: {}
    title_hidden: true
    listen:
      Grupo de Artículos: vw_largo_plazo_trazabilidad.grupoarticulo
      Grupo de artículos externo: vw_largo_plazo_trazabilidad.grupoarticuloexterno
      Centro: vw_largo_plazo_trazabilidad.centro
      Periodo: vw_largo_plazo_trazabilidad.periodo
      Material: vw_largo_plazo_trazabilidad.sku
    row: 4
    col: 0
    width: 20
    height: 2
  - title: Centros
    name: Centros
    model: cadena_suministro
    explore: vw_largo_plazo_trazabilidad
    type: looker_wordcloud
    fields: [vw_largo_plazo_trazabilidad.sku_unicos, vw_largo_plazo_trazabilidad.centro]
    sorts: [vw_largo_plazo_trazabilidad.sku_unicos desc 0]
    limit: 500
    column_limit: 50
    color_application: undefined
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
      Grupo de Artículos: vw_largo_plazo_trazabilidad.grupoarticulo
      Grupo de artículos externo: vw_largo_plazo_trazabilidad.grupoarticuloexterno
      Centro: vw_largo_plazo_trazabilidad.centro
      Periodo: vw_largo_plazo_trazabilidad.periodo
      Material: vw_largo_plazo_trazabilidad.sku
    row: 2
    col: 20
    width: 4
    height: 4
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
    explore: vw_largo_plazo_trazabilidad
    listens_to_filters: [Grupoarticuloexterno, Grupo de Artículos, Grupo de artículos
        externo, Centro]
    field: vw_largo_plazo_trazabilidad.sku
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
    explore: vw_largo_plazo_trazabilidad
    listens_to_filters: [Material]
    field: vw_largo_plazo_trazabilidad.centro
  - name: Periodo
    title: Periodo
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cadena_suministro
    explore: vw_largo_plazo_trazabilidad
    listens_to_filters: []
    field: vw_largo_plazo_trazabilidad.periodo
  - name: Grupo de Artículos
    title: Grupo de Artículos
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cadena_suministro
    explore: vw_largo_plazo_trazabilidad
    listens_to_filters: [Grupoarticuloexterno, Grupo de artículos externo, Centro,
      Material]
    field: vw_largo_plazo_trazabilidad.grupoarticulo
  - name: Grupo de artículos externo
    title: Grupo de artículos externo
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cadena_suministro
    explore: vw_largo_plazo_trazabilidad
    listens_to_filters: [Grupo de Artículos, Centro, Material]
    field: vw_largo_plazo_trazabilidad.grupoarticuloexterno
