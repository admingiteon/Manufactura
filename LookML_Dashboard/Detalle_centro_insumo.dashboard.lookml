---
- dashboard: detalle_por_centroinsumo
  title: Detalle por centro/insumo
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  refresh: 1 hour
  preferred_slug: 31jxl0IVj6BIqy7NG0uze1
  elements:
  - title: Largo Plazo Trazabilidad
    name: Largo Plazo Trazabilidad
    model: cadena_suministro
    explore: vw_largo_plazo_trazabilidad_drill
    type: looker_grid
    fields: [vw_largo_plazo_trazabilidad_drill.sku, vw_largo_plazo_trazabilidad_drill.drill01,
      vw_largo_plazo_trazabilidad_drill.drill01describe, vw_largo_plazo_trazabilidad_drill.Total_cantidad,
      vw_largo_plazo_trazabilidad_drill.periodo]
    pivots: [vw_largo_plazo_trazabilidad_drill.periodo]
    filters: {}
    sorts: [vw_largo_plazo_trazabilidad_drill.periodo, vw_largo_plazo_trazabilidad_drill.sku,
      vw_largo_plazo_trazabilidad_drill.drill01]
    limit: 500
    column_limit: 50
    total: true
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
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels: {}
    series_cell_visualizations:
      cantidad:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    hidden_fields: []
    hidden_points_if_no: []
    theme: looker
    customTheme: ''
    layout: auto
    minWidthForIndexColumns: true
    headerFontSize: 14
    bodyFontSize: 14
    showTooltip: true
    showHighlight: true
    columnOrder: {}
    rowSubtotals: true
    colSubtotals: false
    spanRows: true
    spanCols: true
    calculateOthers: false
    sortColumnsBy: measures
    useViewName: false
    useHeadings: false
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|vw_largo_plazo_trazabilidad_drill.sku: SKU
    heading|vw_largo_plazo_trazabilidad_drill.sku: ''
    hide|vw_largo_plazo_trazabilidad_drill.sku: true
    label|vw_largo_plazo_trazabilidad_drill.drill01: Centro / Insumo
    heading|vw_largo_plazo_trazabilidad_drill.drill01: ''
    hide|vw_largo_plazo_trazabilidad_drill.drill01: false
    label|vw_largo_plazo_trazabilidad_drill.drill01describe: Nombre
    heading|vw_largo_plazo_trazabilidad_drill.drill01describe: Nombre
    hide|vw_largo_plazo_trazabilidad_drill.drill01describe: false
    subtotalDepth: '1'
    label|cantidad: Cantidad
    heading|cantidad: ''
    style|cantidad: black_red
    reportIn|cantidad: '1'
    unit|cantidad: ''
    comparison|cantidad: no_variance
    switch|cantidad: true
    var_num|cantidad: false
    var_pct|cantidad: false
    label|skulimpio: SKU
    heading|skulimpio: ''
    hide|skulimpio: false
    label|vw_largo_plazo_trazabilidad_drill.concepto: Concepto
    heading|vw_largo_plazo_trazabilidad_drill.concepto: ''
    hide|vw_largo_plazo_trazabilidad_drill.concepto: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      SKU: vw_largo_plazo_trazabilidad_drill.sku
      Concepto: vw_largo_plazo_trazabilidad_drill.id_concepto
    row: 3
    col: 0
    width: 24
    height: 12
  - title: Sin título
    name: Sin título
    model: cadena_suministro
    explore: vw_largo_plazo_trazabilidad_drill
    type: single_value
    fields: [concepto_limpio, vw_largo_plazo_trazabilidad_drill.count]
    sorts: [concepto_limpio]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: replace(${vw_largo_plazo_trazabilidad_drill.concepto} ,"_"," ")
      label: Concepto limpio
      value_format:
      value_format_name:
      dimension: concepto_limpio
      _kind_hint: dimension
      _type_hint: string
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
    custom_color: "#154360"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#FC9200",
        font_color: "#B4DED2", color_application: {collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7,
          palette_id: 97ce1e3f-9504-4d5c-835b-3fbaf78c084a}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: [vw_largo_plazo_trazabilidad_drill.count]
    listen:
      Concepto: vw_largo_plazo_trazabilidad_drill.id_concepto
      SKU: vw_largo_plazo_trazabilidad_drill.sku
    row: 2
    col: 0
    width: 24
    height: 1
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
  filters:
  - name: Concepto
    title: Concepto
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: true
    ui_config:
      type: tag_list
      display: popover
      options:
      - '5'
      - '6'
      - '7'
    model: cadena_suministro
    explore: vw_largo_plazo_trazabilidad_drill
    listens_to_filters: []
    field: vw_largo_plazo_trazabilidad_drill.id_concepto
  - name: SKU
    title: SKU
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cadena_suministro
    explore: vw_largo_plazo_trazabilidad_drill
    listens_to_filters: [Concepto]
    field: vw_largo_plazo_trazabilidad_drill.sku
