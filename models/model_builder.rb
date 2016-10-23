class ModelBuilder

  def self.models_from_data( model_class, models_data )
    models = models_data.map { |model_data| model_class.new(model_data) }
    return models
  end

  def self.model_from_data( model_class, models_data )
    model = self.models_from_data( model_class, model_data ).first
    return model
  end

end
