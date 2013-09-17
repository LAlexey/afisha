class DatePickerInput
  include Formtastic::Inputs::Base
  include Formtastic::Inputs::Base::Stringish
  include Formtastic::Inputs::Base::Placeholder

  def input_html_options
    super.merge(:class => 'date-picker')
  end
end