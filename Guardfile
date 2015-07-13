#
# DO any prep work here - normally I run tasks to load translations etc here..
#
# - watch the app models and the spec/fast/model folders for changes and run the tests!
guard 'rake', :task => 'tests:select:fast' do
  watch(%r{^app/models/(.+)\.rb})
  watch(%r{^app/lib/(.+)\.rb})
  watch(%r{^spec/fast/models/(.+)\.rb})
end
#
# - watch the controllers and spec/controller folders for changes and run the tests!
guard 'rake', :task => 'tests:select:controllers' do
  watch(%r{^app/controllers/(.+)\.rb})
  watch(%r{^spec/controllers/(.+)\.rb})
end
