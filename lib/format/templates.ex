defmodule OData.Format.Templates do
  require EEx

  @feed_start_template  """
    <?xml version="1.0" encoding="utf-8" standalone="yes"?>
    <feed xml:base="https://<%= server %><%= path %>"\
     xmlns:d="http://schemas.microsoft.com/ado/2007/08/dataservices"\
     xmlns:m="http://schemas.microsoft.com/ado/2007/08/dataservices/metadata"\
     xmlns="http://www.w3.org/2005/Atom">
      <title type="text"><%= collection %></title>
      <id>https://<%= server %><%= path %>/<%= collection %></id>
      <updated><%= update %></updated>
      <m:count><%= total_count %></m:count>
      <link rel="self" title="<%= collection %>"\
     href="https://<%= server %><%= path %>/<%= collection %>" />
    """
  @feed_end_template "</feed>"



  @next_rel_template  """
    <link rel="next" href="https://<%= server %><%= path %>/\
    <%= collection %><%= next_query_string %>" />
  """

  @item_start_template """
      <entry>
        <id>https://<%= server %><%= path %>/<%= collection %>(<%= rowid %>)</id>
        <title type="text"></title>
        <updated><%= update %></updated>
        <author><name /></author>
        <category term="elixir.odata"\
     scheme="http://schemas.microsoft.com/ado/2007/08/dataservices/scheme" />
        <content type="application/xml">
          <m:properties>
    """

  @item_end_template """
        </m:properties>
      </content>
    </entry>
  """

  @cell_template "<d:<%= name %> m:type=\"<%= type %>\"><%= value %></d:<%= name %>>"
  @cell_template_null  "<d:<%= name %> m:type=\"<%= type %>\" m:null=\"true\" />"


  # Pre-compile the templates into functions
  EEx.function_from_string :def, :feed_start, @feed_start_template, [:server, :path, :collection, :update, :total_count]
  EEx.function_from_string :def, :feed_end, @feed_end_template, []
  EEx.function_from_string :def, :next_rel_template, @next_rel_template, [:server, :path, :collection, :next_query_string]
  EEx.function_from_string :def, :item_start, @item_start_template, [:server, :path, :collection, :rowid, :update]
  EEx.function_from_string :def, :item_end, @item_end_template, []
  EEx.function_from_string :def, :cell, @cell_template, [:name, :type, :value]
  EEx.function_from_string :def, :cell_null, @cell_template_null, [:name, :type]



end