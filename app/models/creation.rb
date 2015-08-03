class Creation < ActiveRecord::Base
  include FileService::Resource

  has_attached_file :image,
    :convert_options => { :all => "-convolve -1,-1,-1,-1,16,-1,-1,-1,-1 -bias 8 -quality 85" },
    :path            => ":rails_root/public/systme/:class/:attachment/:id_partition/:style_:basename.:extension",
    :url             => "/system/:class/:attachment/:id_partition/:style_:basename.:extension",
    :styles => { 
      :micro => { :geometry => "56x56",   :quality => 85, :sharpen => true },
      :thumb => { :geometry => "85x85",   :quality => 85, :sharpen => true },
      :normal   => { :geometry => "150x150", :quality => 85, :sharpen => true },
      :large    => { :geometry => "250x250", :quality => 85, :sharpen => true }
    },
    :default_style => :normal
end
