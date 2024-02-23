---
- dashboard: reporte_catalogo_materiales_validacin
  title: Reporte Catalogo Materiales (Validación)
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  refresh: 1 hour
  preferred_slug: SJld8dYlfT5vf4rYp5vXKN
  elements:
  - title: Tabla de campos y datos contenidos en la vista
    name: Tabla de campos y datos contenidos en la vista
    model: cadena_suministro
    explore: vw_catalogo_materiales
    type: looker_grid
    fields: [vw_catalogo_materiales.numero_material_nivel2, vw_catalogo_materiales.texto_breve_material_nivel2,
      vw_catalogo_materiales.componente_nivel2, vw_catalogo_materiales.grupo_de_articulos_nivel2,
      vw_catalogo_materiales.categoria_de_lista_de_materiales_stasnivel2, vw_catalogo_materiales.unidad_de_medida_nivel2,
      vw_catalogo_materiales.num_lista_materiales_nivel2, vw_catalogo_materiales.centro_nivel2,
      vw_catalogo_materiales.alternativa_lista_materiales_nivel2, vw_catalogo_materiales.num_nodo_lista_materiales_nivel2,
      vw_catalogo_materiales.cantidad_nivel2, vw_catalogo_materiales.version_nivel2,
      vw_catalogo_materiales.estatus_general_nivel2]
    sorts: [vw_catalogo_materiales.num_lista_materiales_nivel2]
    limit: 500
    column_limit: 50
    show_view_names: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
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
      vw_catalogo_materiales.numero_material_nivel2: Número material nivel 2
      vw_catalogo_materiales.texto_breve_material_nivel2: Texto breve material nivel
        2
      vw_catalogo_materiales.grupo_de_articulos_nivel2: Grupo nivel 2
      vw_catalogo_materiales.componente_nivel2: Componente nivel 2
      vw_catalogo_materiales.categoria_de_lista_de_materiales_stasnivel2: Categoría
        Material
      vw_catalogo_materiales.unidad_de_medida_nivel2: Unidad de medida
      vw_catalogo_materiales.num_lista_materiales_nivel2: Número de Lista
      vw_catalogo_materiales.centro_nivel2: Centro
      vw_catalogo_materiales.alternativa_lista_materiales_nivel2: Alternativa lista
        materiales
      vw_catalogo_materiales.num_nodo_lista_materiales_nivel2: Número de nodo
      vw_catalogo_materiales.cantidad_nivel2: Cantidad
      vw_catalogo_materiales.version_nivel2: Verdión
      vw_catalogo_materiales.estatus_general_nivel2: Estatus General
    series_column_widths:
      vw_catalogo_materiales.numero_material_nivel2: 163
      vw_catalogo_materiales.texto_breve_material_nivel2: 331
      vw_catalogo_materiales.componente_nivel2: 168
      vw_catalogo_materiales.grupo_de_articulos_nivel2: 107
      vw_catalogo_materiales.categoria_de_lista_de_materiales_stasnivel2: 150
    series_text_format:
      vw_catalogo_materiales.numero_material_nivel2:
        align: left
    defaults_version: 1
    listen:
      Grupo De Articulos Nivel2: vw_catalogo_materiales.grupo_de_articulos_nivel2
      Centro Nivel2: vw_catalogo_materiales.centro_nivel2
      Numero Material Nivel2: vw_catalogo_materiales.numero_material_nivel2
    row: 0
    col: 0
    width: 24
    height: 9
  - title: Lista de materiales
    name: Lista de materiales
    model: cadena_suministro
    explore: vw_catalogo_materiales
    type: looker_grid
    fields: [vw_catalogo_materiales.texto_breve_material_nivel2, numero_componentes]
    sorts: [numero_componentes desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression:
      label: Número Componentes
      value_format:
      value_format_name:
      based_on: vw_catalogo_materiales.componente_nivel2
      _kind_hint: measure
      measure: numero_componentes
      type: count_distinct
      _type_hint: number
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
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
      vw_catalogo_materiales.texto_breve_material_nivel2: Texto breve material 2
      numero_componentes: Cantidad de componentes
    series_column_widths:
      vw_catalogo_materiales.texto_breve_material_nivel2: 280
      numero_componentes: 159
    series_cell_visualizations:
      numero_componentes:
        is_active: false
    series_text_format:
      vw_catalogo_materiales.texto_breve_material_nivel2:
        align: left
      numero_componentes:
        align: left
    defaults_version: 1
    title_hidden: true
    listen:
      Grupo De Articulos Nivel2: vw_catalogo_materiales.grupo_de_articulos_nivel2
      Centro Nivel2: vw_catalogo_materiales.centro_nivel2
      Numero Material Nivel2: vw_catalogo_materiales.numero_material_nivel2
    row: 9
    col: 0
    width: 7
    height: 3
  - title: Sin título
    name: Sin título
    model: cadena_suministro
    explore: vw_catalogo_materiales
    type: single_value
    fields: [numero_de_materiales]
    limit: 500
    dynamic_fields:
    - category: measure
      expression:
      label: Número de materiales
      value_format:
      value_format_name:
      based_on: vw_catalogo_materiales.numero_material_nivel2
      _kind_hint: measure
      measure: numero_de_materiales
      type: count_distinct
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#079c98"
    single_value_title: Número de materiales
    defaults_version: 1
    listen:
      Grupo De Articulos Nivel2: vw_catalogo_materiales.grupo_de_articulos_nivel2
      Centro Nivel2: vw_catalogo_materiales.centro_nivel2
      Numero Material Nivel2: vw_catalogo_materiales.numero_material_nivel2
    row: 9
    col: 7
    width: 3
    height: 2
  filters:
  - name: Grupo De Articulos Nivel2
    title: Grupo De Articulos Nivel2
    type: field_filter
    default_value: ''
    allow_multiple_values: false
    required: false
    ui_config:
      type: advanced
      display: popover
    model: cadena_suministro
    explore: vw_catalogo_materiales
    listens_to_filters: []
    field: vw_catalogo_materiales.grupo_de_articulos_nivel2
  - name: Centro Nivel2
    title: Centro Nivel2
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cadena_suministro
    explore: vw_catalogo_materiales
    listens_to_filters: []
    field: vw_catalogo_materiales.centro_nivel2
  - name: Numero Material Nivel2
    title: Numero Material Nivel2
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cadena_suministro
    explore: vw_catalogo_materiales
    listens_to_filters: []
    field: vw_catalogo_materiales.numero_material_nivel2
