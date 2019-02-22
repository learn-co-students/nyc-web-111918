class BotSerializer < ActiveModel::Serializer
  attributes :id, :name, :health, :damage, :armor, :bot_class, :catchphrase, :avatar_url
end
