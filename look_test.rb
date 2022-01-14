class Message < ApplicationRecord
  has_many :mentions
  belongs_to :creator, class_name: 'User'
  belongs_to :channel

  after_create :create_here_mention, if: :here?
  after_create :create_channel_mention, if: :channel?

  def here?; end # 省略
  def channel?; end #省略

  def create_here_mention
    HereMentionCreator.call(message: self)
  end

  def create_channel_mention
    ChannelMentionCreator.call(message: self)
  end
end
class HereMentionCreator
  delegate :channel, :creator, to: :message

  def self.call(message:)
    new(message: message).call
  end

  def initialize(message:)
    @message = message
  end

  def call
    members.each do |member|
      message.mentions.create!(to: member, chennel: channel)
    end
  end

  private

  attr_reader :message

  def members
    @members ||= channel.members.active - [creator]
  end
end
class ChannelMentionCreator
  delegate :channel, :creator, to: :message

  def self.call(message:)
    new(message: message).call
  end

  def initialize(message:)
    @message = message
  end

  def call
    members.each do |member|
      message.mentions.create!(to: member, chennel: channel)
    end
  end

  private

  attr_reader :message

  def members
    @members ||= channel.members - [creator]
  end
end