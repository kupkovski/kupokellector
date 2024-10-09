module CollectionsHelper
  def active_style(query_param, current_option)
    selected_style = "background-color: rgb(82, 95, 122); padding: 5px"
    query_param ||= "all"
    query_param == current_option ? selected_style : ''
  end
end
