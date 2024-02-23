---
- dashboard: tablero_largo_plazo_presupuesto_simulado
  title: Tablero largo plazo (Presupuesto) Simulado
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: AXJOlqG51ueRJatGq7iyHp
  elements:
  - title: Tablero largo plazo (Presupuesto) Simulado
    name: Tablero largo plazo (Presupuesto) Simulado
    model: cadena_suministro
    explore: tb_largo_plazo_presupuesto_nv
    type: looker_grid
    fields: [tb_largo_plazo_presupuesto_nv.orden_concepto, tb_largo_plazo_presupuesto_nv.concepto,
      tb_largo_plazo_presupuesto_nv.Total_cantidad, tb_largo_plazo_presupuesto_nv.periodo]
    pivots: [tb_largo_plazo_presupuesto_nv.periodo]
    sorts: [tb_largo_plazo_presupuesto_nv.periodo, tb_largo_plazo_presupuesto_nv.orden_concepto]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
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
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      tb_largo_plazo_presupuesto_nv.orden_concepto: Id
    series_cell_visualizations:
      tb_largo_plazo_presupuesto_nv.Total_cantidad:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Material: tb_largo_plazo_presupuesto_nv.sku
      Centro: tb_largo_plazo_presupuesto_nv.centro
      Grupo articulo: tb_largo_plazo_presupuesto_nv.grupoarticulo
      Grupo articulo externo: tb_largo_plazo_presupuesto_nv.grupoarticuloexterno
      Tipo Escenario: tb_largo_plazo_presupuesto_nv.tipo_escenario
    row: 6
    col: 0
    width: 24
    height: 12
  - title: New Tile
    name: New Tile
    model: cadena_suministro
    explore: tb_largo_plazo_presupuesto_nv
    type: single_value
    fields: [tb_largo_plazo_presupuesto_nv.sku_describe]
    sorts: [tb_largo_plazo_presupuesto_nv.sku_describe]
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
    custom_color: "#5D6D7E"
    single_value_title: Numero SKU
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      tb_largo_plazo_presupuesto_nv.orden_concepto: Id
    series_cell_visualizations:
      tb_largo_plazo_presupuesto_nv.Total_cantidad:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Material: tb_largo_plazo_presupuesto_nv.sku
      Centro: tb_largo_plazo_presupuesto_nv.centro
      Grupo articulo: tb_largo_plazo_presupuesto_nv.grupoarticulo
      Grupo articulo externo: tb_largo_plazo_presupuesto_nv.grupoarticuloexterno
      Tipo Escenario: tb_largo_plazo_presupuesto_nv.tipo_escenario
    row: 2
    col: 3
    width: 17
    height: 4
  - title: New Tile
    name: New Tile (2)
    model: cadena_suministro
    explore: tb_largo_plazo_presupuesto_nv
    type: single_value
    fields: [tb_largo_plazo_presupuesto_nv.sku_unicos]
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
    custom_color: "#5D6D7E"
    single_value_title: Numero SKU
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#5D6D7E",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      tb_largo_plazo_presupuesto_nv.orden_concepto: Id
    series_cell_visualizations:
      tb_largo_plazo_presupuesto_nv.Total_cantidad:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Material: tb_largo_plazo_presupuesto_nv.sku
      Centro: tb_largo_plazo_presupuesto_nv.centro
      Grupo articulo: tb_largo_plazo_presupuesto_nv.grupoarticulo
      Grupo articulo externo: tb_largo_plazo_presupuesto_nv.grupoarticuloexterno
      Tipo Escenario: tb_largo_plazo_presupuesto_nv.tipo_escenario
    row: 2
    col: 0
    width: 3
    height: 2
  - title: New Tile
    name: New Tile (3)
    model: cadena_suministro
    explore: tb_largo_plazo_presupuesto_nv
    type: single_value
    fields: [tb_largo_plazo_presupuesto_nv.Total_importe_costo]
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
    custom_color: "#5D6D7E"
    single_value_title: Costo
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#5D6D7E",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      tb_largo_plazo_presupuesto_nv.orden_concepto: Id
    series_cell_visualizations:
      tb_largo_plazo_presupuesto_nv.Total_cantidad:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Material: tb_largo_plazo_presupuesto_nv.sku
      Centro: tb_largo_plazo_presupuesto_nv.centro
      Grupo articulo: tb_largo_plazo_presupuesto_nv.grupoarticulo
      Grupo articulo externo: tb_largo_plazo_presupuesto_nv.grupoarticuloexterno
      Tipo Escenario: tb_largo_plazo_presupuesto_nv.tipo_escenario
    row: 4
    col: 0
    width: 3
    height: 2
  - title: Centro
    name: Centro
    model: cadena_suministro
    explore: tb_largo_plazo_presupuesto_nv
    type: looker_wordcloud
    fields: [tb_largo_plazo_presupuesto_nv.centro, tb_largo_plazo_presupuesto_nv.Total_cantidad]
    sorts: [tb_largo_plazo_presupuesto_nv.Total_cantidad desc 0]
    limit: 500
    column_limit: 50
    color_application: undefined
    custom_color_enabled: true
    custom_color: "#5D6D7E"
    show_single_value_title: true
    single_value_title: Costo
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
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      tb_largo_plazo_presupuesto_nv.orden_concepto: Id
    series_cell_visualizations:
      tb_largo_plazo_presupuesto_nv.Total_cantidad:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Material: tb_largo_plazo_presupuesto_nv.sku
      Centro: tb_largo_plazo_presupuesto_nv.centro
      Grupo articulo: tb_largo_plazo_presupuesto_nv.grupoarticulo
      Grupo articulo externo: tb_largo_plazo_presupuesto_nv.grupoarticuloexterno
      Tipo Escenario: tb_largo_plazo_presupuesto_nv.tipo_escenario
    row: 2
    col: 20
    width: 4
    height: 4
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
    explore: tb_largo_plazo_presupuesto_nv
    listens_to_filters: [Centro, Grupo articulo]
    field: tb_largo_plazo_presupuesto_nv.sku
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
    explore: tb_largo_plazo_presupuesto_nv
    listens_to_filters: [Material, Grupo articulo]
    field: tb_largo_plazo_presupuesto_nv.centro
  - name: Grupo articulo
    title: Grupo articulo
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: cadena_suministro
    explore: tb_largo_plazo_presupuesto_nv
    listens_to_filters: [Material, Centro]
    field: tb_largo_plazo_presupuesto_nv.grupoarticulo
  - name: Grupo articulo externo
    title: Grupo articulo externo
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cadena_suministro
    explore: tb_largo_plazo_presupuesto_nv
    listens_to_filters: [Material, Centro, Grupo articulo]
    field: tb_largo_plazo_presupuesto_nv.grupoarticuloexterno
  - name: Tipo Escenario
    title: Tipo Escenario
    type: field_filter
    default_value: Simulado
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
    model: cadena_suministro
    explore: tb_largo_plazo_presupuesto_nv
    listens_to_filters: []
    field: tb_largo_plazo_presupuesto_nv.tipo_escenario
