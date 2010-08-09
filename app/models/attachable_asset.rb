class AttachableAsset < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true

  def attachable_type=(s_type)
    super(s_type.to_s.classify.constantize.base_class.to_s)
  end
end
