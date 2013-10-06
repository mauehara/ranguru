module JrubyMahout
  class DataModel
    java_import org.apache.mahout.cf.taste.impl.model.file.FileDataModel

    attr_accessor :data_model

    def initialize(data_model_type, params)
      case data_model_type
        when "file"
          @data_model = FileDataModel.new(java.io.File.new(params[:file_path]))
        when "mysql"
          # TODO: implement
          #@data_model = nil

          dataSource = com.mysql.jdbc.jdbc2.optional.MysqlDataSource.new

          dataSource.setServerName("localhost")
          dataSource.setUser("root")
          dataSource.setPassword("123456")
          dataSource.setDatabaseName("ranguru")
          dataModel = org.apache.mahout.cf.taste.impl.model.jdbc.MySQLJDBCDataModel.new(dataSource, "ratings", "user_id", "restaurant_id", "rating","created_at");
          @data_model = dataModel
        when "postgres"
          @data_model = PostgresManager.new(params).setup_data_model(params)
        else
          @data_model = nil
      end
    end
  end
end

