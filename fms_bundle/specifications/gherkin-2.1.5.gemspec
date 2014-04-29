# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{gherkin}
  s.version = "2.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Sassak", "Gregory Hnatiuk", "Aslak Helles\u00F8y"]
  s.date = %q{2010-07-17}
  s.default_executable = %q{gherkin}
  s.description = %q{A fast Gherkin lexer/parser based on the Ragel State Machine Compiler.}
  s.email = %q{cukes@googlegroups.com}
  s.executables = ["gherkin"]
  s.extensions = ["ext/gherkin_lexer_ar/extconf.rb", "ext/gherkin_lexer_bg/extconf.rb", "ext/gherkin_lexer_ca/extconf.rb", "ext/gherkin_lexer_cs/extconf.rb", "ext/gherkin_lexer_cy_gb/extconf.rb", "ext/gherkin_lexer_da/extconf.rb", "ext/gherkin_lexer_de/extconf.rb", "ext/gherkin_lexer_en/extconf.rb", "ext/gherkin_lexer_en_au/extconf.rb", "ext/gherkin_lexer_en_lol/extconf.rb", "ext/gherkin_lexer_en_pirate/extconf.rb", "ext/gherkin_lexer_en_scouse/extconf.rb", "ext/gherkin_lexer_en_tx/extconf.rb", "ext/gherkin_lexer_eo/extconf.rb", "ext/gherkin_lexer_es/extconf.rb", "ext/gherkin_lexer_et/extconf.rb", "ext/gherkin_lexer_fi/extconf.rb", "ext/gherkin_lexer_fr/extconf.rb", "ext/gherkin_lexer_he/extconf.rb", "ext/gherkin_lexer_hr/extconf.rb", "ext/gherkin_lexer_hu/extconf.rb", "ext/gherkin_lexer_id/extconf.rb", "ext/gherkin_lexer_it/extconf.rb", "ext/gherkin_lexer_ja/extconf.rb", "ext/gherkin_lexer_ko/extconf.rb", "ext/gherkin_lexer_lt/extconf.rb", "ext/gherkin_lexer_lu/extconf.rb", "ext/gherkin_lexer_lv/extconf.rb", "ext/gherkin_lexer_nl/extconf.rb", "ext/gherkin_lexer_no/extconf.rb", "ext/gherkin_lexer_pl/extconf.rb", "ext/gherkin_lexer_pt/extconf.rb", "ext/gherkin_lexer_ro/extconf.rb", "ext/gherkin_lexer_ro_ro/extconf.rb", "ext/gherkin_lexer_ru/extconf.rb", "ext/gherkin_lexer_sk/extconf.rb", "ext/gherkin_lexer_sr_cyrl/extconf.rb", "ext/gherkin_lexer_sr_latn/extconf.rb", "ext/gherkin_lexer_sv/extconf.rb", "ext/gherkin_lexer_tr/extconf.rb", "ext/gherkin_lexer_uk/extconf.rb", "ext/gherkin_lexer_uz/extconf.rb", "ext/gherkin_lexer_vi/extconf.rb", "ext/gherkin_lexer_zh_cn/extconf.rb", "ext/gherkin_lexer_zh_tw/extconf.rb"]
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = [".gitattributes", ".gitignore", ".mailmap", ".rspec", "History.txt", "LICENSE", "README.rdoc", "Rakefile", "VERSION.yml", "bin/gherkin", "cucumber.yml", "ext/gherkin_lexer_ar/gherkin_lexer_ar.c", "ext/gherkin_lexer_bg/gherkin_lexer_bg.c", "ext/gherkin_lexer_ca/gherkin_lexer_ca.c", "ext/gherkin_lexer_cs/gherkin_lexer_cs.c", "ext/gherkin_lexer_cy_gb/gherkin_lexer_cy_gb.c", "ext/gherkin_lexer_da/gherkin_lexer_da.c", "ext/gherkin_lexer_de/gherkin_lexer_de.c", "ext/gherkin_lexer_en/gherkin_lexer_en.c", "ext/gherkin_lexer_en_au/gherkin_lexer_en_au.c", "ext/gherkin_lexer_en_lol/gherkin_lexer_en_lol.c", "ext/gherkin_lexer_en_pirate/gherkin_lexer_en_pirate.c", "ext/gherkin_lexer_en_scouse/gherkin_lexer_en_scouse.c", "ext/gherkin_lexer_en_tx/gherkin_lexer_en_tx.c", "ext/gherkin_lexer_eo/gherkin_lexer_eo.c", "ext/gherkin_lexer_es/gherkin_lexer_es.c", "ext/gherkin_lexer_et/gherkin_lexer_et.c", "ext/gherkin_lexer_fi/gherkin_lexer_fi.c", "ext/gherkin_lexer_fr/gherkin_lexer_fr.c", "ext/gherkin_lexer_he/gherkin_lexer_he.c", "ext/gherkin_lexer_hr/gherkin_lexer_hr.c", "ext/gherkin_lexer_hu/gherkin_lexer_hu.c", "ext/gherkin_lexer_id/gherkin_lexer_id.c", "ext/gherkin_lexer_it/gherkin_lexer_it.c", "ext/gherkin_lexer_ja/gherkin_lexer_ja.c", "ext/gherkin_lexer_ko/gherkin_lexer_ko.c", "ext/gherkin_lexer_lt/gherkin_lexer_lt.c", "ext/gherkin_lexer_lu/gherkin_lexer_lu.c", "ext/gherkin_lexer_lv/gherkin_lexer_lv.c", "ext/gherkin_lexer_nl/gherkin_lexer_nl.c", "ext/gherkin_lexer_no/gherkin_lexer_no.c", "ext/gherkin_lexer_pl/gherkin_lexer_pl.c", "ext/gherkin_lexer_pt/gherkin_lexer_pt.c", "ext/gherkin_lexer_ro/gherkin_lexer_ro.c", "ext/gherkin_lexer_ro_ro/gherkin_lexer_ro_ro.c", "ext/gherkin_lexer_ru/gherkin_lexer_ru.c", "ext/gherkin_lexer_sk/gherkin_lexer_sk.c", "ext/gherkin_lexer_sr_cyrl/gherkin_lexer_sr_cyrl.c", "ext/gherkin_lexer_sr_latn/gherkin_lexer_sr_latn.c", "ext/gherkin_lexer_sv/gherkin_lexer_sv.c", "ext/gherkin_lexer_tr/gherkin_lexer_tr.c", "ext/gherkin_lexer_uk/gherkin_lexer_uk.c", "ext/gherkin_lexer_uz/gherkin_lexer_uz.c", "ext/gherkin_lexer_vi/gherkin_lexer_vi.c", "ext/gherkin_lexer_zh_cn/gherkin_lexer_zh_cn.c", "ext/gherkin_lexer_zh_tw/gherkin_lexer_zh_tw.c", "features/escaped_pipes.feature", "features/feature_parser.feature", "features/json_formatter.feature", "features/json_parser.feature", "features/native_lexer.feature", "features/parser_with_native_lexer.feature", "features/pretty_formatter.feature", "features/step_definitions/eyeball_steps.rb", "features/step_definitions/gherkin_steps.rb", "features/step_definitions/json_formatter_steps.rb", "features/step_definitions/json_lexer_steps.rb", "features/step_definitions/pretty_formatter_steps.rb", "features/steps_parser.feature", "features/support/env.rb", "ikvm/.gitignore", "java/.gitignore", "java/src/main/java/gherkin/lexer/.gitignore", "java/src/main/resources/gherkin/.gitignore", "lib/.gitignore", "lib/gherkin.rb", "lib/gherkin/c_lexer.rb", "lib/gherkin/cli/main.rb", "lib/gherkin/formatter/argument.rb", "lib/gherkin/formatter/colors.rb", "lib/gherkin/formatter/escaping.rb", "lib/gherkin/formatter/filter_formatter.rb", "lib/gherkin/formatter/json_formatter.rb", "lib/gherkin/formatter/line_filter.rb", "lib/gherkin/formatter/model.rb", "lib/gherkin/formatter/monochrome_format.rb", "lib/gherkin/formatter/pretty_formatter.rb", "lib/gherkin/formatter/regexp_filter.rb", "lib/gherkin/formatter/tag_count_formatter.rb", "lib/gherkin/i18n.rb", "lib/gherkin/i18n.yml", "lib/gherkin/i18n_lexer.rb", "lib/gherkin/json_parser.rb", "lib/gherkin/listener/event.rb", "lib/gherkin/listener/formatter_listener.rb", "lib/gherkin/native.rb", "lib/gherkin/native/ikvm.rb", "lib/gherkin/native/java.rb", "lib/gherkin/native/null.rb", "lib/gherkin/parser/meta.txt", "lib/gherkin/parser/parser.rb", "lib/gherkin/parser/root.txt", "lib/gherkin/parser/steps.txt", "lib/gherkin/rb_lexer.rb", "lib/gherkin/rb_lexer/.gitignore", "lib/gherkin/rb_lexer/README.rdoc", "lib/gherkin/rb_lexer/ar.rb", "lib/gherkin/rb_lexer/bg.rb", "lib/gherkin/rb_lexer/ca.rb", "lib/gherkin/rb_lexer/cs.rb", "lib/gherkin/rb_lexer/cy_gb.rb", "lib/gherkin/rb_lexer/da.rb", "lib/gherkin/rb_lexer/de.rb", "lib/gherkin/rb_lexer/en.rb", "lib/gherkin/rb_lexer/en_au.rb", "lib/gherkin/rb_lexer/en_lol.rb", "lib/gherkin/rb_lexer/en_pirate.rb", "lib/gherkin/rb_lexer/en_scouse.rb", "lib/gherkin/rb_lexer/en_tx.rb", "lib/gherkin/rb_lexer/eo.rb", "lib/gherkin/rb_lexer/es.rb", "lib/gherkin/rb_lexer/et.rb", "lib/gherkin/rb_lexer/fi.rb", "lib/gherkin/rb_lexer/fr.rb", "lib/gherkin/rb_lexer/he.rb", "lib/gherkin/rb_lexer/hr.rb", "lib/gherkin/rb_lexer/hu.rb", "lib/gherkin/rb_lexer/id.rb", "lib/gherkin/rb_lexer/it.rb", "lib/gherkin/rb_lexer/ja.rb", "lib/gherkin/rb_lexer/ko.rb", "lib/gherkin/rb_lexer/lt.rb", "lib/gherkin/rb_lexer/lu.rb", "lib/gherkin/rb_lexer/lv.rb", "lib/gherkin/rb_lexer/nl.rb", "lib/gherkin/rb_lexer/no.rb", "lib/gherkin/rb_lexer/pl.rb", "lib/gherkin/rb_lexer/pt.rb", "lib/gherkin/rb_lexer/ro.rb", "lib/gherkin/rb_lexer/ro_ro.rb", "lib/gherkin/rb_lexer/ru.rb", "lib/gherkin/rb_lexer/sk.rb", "lib/gherkin/rb_lexer/sr_cyrl.rb", "lib/gherkin/rb_lexer/sr_latn.rb", "lib/gherkin/rb_lexer/sv.rb", "lib/gherkin/rb_lexer/tr.rb", "lib/gherkin/rb_lexer/uk.rb", "lib/gherkin/rb_lexer/uz.rb", "lib/gherkin/rb_lexer/vi.rb", "lib/gherkin/rb_lexer/zh_cn.rb", "lib/gherkin/rb_lexer/zh_tw.rb", "lib/gherkin/rubify.rb", "lib/gherkin/tag_expression.rb", "lib/gherkin/tools.rb", "lib/gherkin/tools/files.rb", "lib/gherkin/tools/reformat.rb", "lib/gherkin/tools/stats.rb", "lib/gherkin/tools/stats_listener.rb", "ragel/i18n/.gitignore", "ragel/lexer.c.rl.erb", "ragel/lexer.java.rl.erb", "ragel/lexer.rb.rl.erb", "ragel/lexer_common.rl.erb", "spec/gherkin/c_lexer_spec.rb", "spec/gherkin/fixtures/1.feature", "spec/gherkin/fixtures/comments_in_table.feature", "spec/gherkin/fixtures/complex.feature", "spec/gherkin/fixtures/complex.json", "spec/gherkin/fixtures/complex_for_filtering.feature", "spec/gherkin/fixtures/complex_with_tags.feature", "spec/gherkin/fixtures/dos_line_endings.feature", "spec/gherkin/fixtures/hantu_pisang.feature", "spec/gherkin/fixtures/i18n_fr.feature", "spec/gherkin/fixtures/i18n_no.feature", "spec/gherkin/fixtures/i18n_zh-CN.feature", "spec/gherkin/fixtures/scenario_outline_with_tags.feature", "spec/gherkin/fixtures/scenario_without_steps.feature", "spec/gherkin/fixtures/simple_with_comments.feature", "spec/gherkin/fixtures/simple_with_tags.feature", "spec/gherkin/fixtures/with_bom.feature", "spec/gherkin/formatter/argument_spec.rb", "spec/gherkin/formatter/colors_spec.rb", "spec/gherkin/formatter/filter_formatter_spec.rb", "spec/gherkin/formatter/model_spec.rb", "spec/gherkin/formatter/pretty_formatter_spec.rb", "spec/gherkin/formatter/spaces.feature", "spec/gherkin/formatter/tabs.feature", "spec/gherkin/formatter/tag_count_formatter_spec.rb", "spec/gherkin/i18n_lexer_spec.rb", "spec/gherkin/i18n_spec.rb", "spec/gherkin/java_lexer_spec.rb", "spec/gherkin/json_parser_spec.rb", "spec/gherkin/output_stream_string_io.rb", "spec/gherkin/parser/parser_spec.rb", "spec/gherkin/rb_lexer_spec.rb", "spec/gherkin/sexp_recorder.rb", "spec/gherkin/shared/lexer_group.rb", "spec/gherkin/shared/py_string_group.rb", "spec/gherkin/shared/row_group.rb", "spec/gherkin/shared/tags_group.rb", "spec/gherkin/tag_expression_spec.rb", "spec/spec_helper.rb", "tasks/bench.rake", "tasks/bench/feature_builder.rb", "tasks/bench/generated/.gitignore", "tasks/bench/null_listener.rb", "tasks/compile.rake", "tasks/cucumber.rake", "tasks/gems.rake", "tasks/ikvm.rake", "tasks/ragel_task.rb", "tasks/rdoc.rake", "tasks/release.rake", "tasks/rspec.rake", "ext/gherkin_lexer_ar/extconf.rb", "ext/gherkin_lexer_bg/extconf.rb", "ext/gherkin_lexer_ca/extconf.rb", "ext/gherkin_lexer_cs/extconf.rb", "ext/gherkin_lexer_cy_gb/extconf.rb", "ext/gherkin_lexer_da/extconf.rb", "ext/gherkin_lexer_de/extconf.rb", "ext/gherkin_lexer_en/extconf.rb", "ext/gherkin_lexer_en_au/extconf.rb", "ext/gherkin_lexer_en_lol/extconf.rb", "ext/gherkin_lexer_en_pirate/extconf.rb", "ext/gherkin_lexer_en_scouse/extconf.rb", "ext/gherkin_lexer_en_tx/extconf.rb", "ext/gherkin_lexer_eo/extconf.rb", "ext/gherkin_lexer_es/extconf.rb", "ext/gherkin_lexer_et/extconf.rb", "ext/gherkin_lexer_fi/extconf.rb", "ext/gherkin_lexer_fr/extconf.rb", "ext/gherkin_lexer_he/extconf.rb", "ext/gherkin_lexer_hr/extconf.rb", "ext/gherkin_lexer_hu/extconf.rb", "ext/gherkin_lexer_id/extconf.rb", "ext/gherkin_lexer_it/extconf.rb", "ext/gherkin_lexer_ja/extconf.rb", "ext/gherkin_lexer_ko/extconf.rb", "ext/gherkin_lexer_lt/extconf.rb", "ext/gherkin_lexer_lu/extconf.rb", "ext/gherkin_lexer_lv/extconf.rb", "ext/gherkin_lexer_nl/extconf.rb", "ext/gherkin_lexer_no/extconf.rb", "ext/gherkin_lexer_pl/extconf.rb", "ext/gherkin_lexer_pt/extconf.rb", "ext/gherkin_lexer_ro/extconf.rb", "ext/gherkin_lexer_ro_ro/extconf.rb", "ext/gherkin_lexer_ru/extconf.rb", "ext/gherkin_lexer_sk/extconf.rb", "ext/gherkin_lexer_sr_cyrl/extconf.rb", "ext/gherkin_lexer_sr_latn/extconf.rb", "ext/gherkin_lexer_sv/extconf.rb", "ext/gherkin_lexer_tr/extconf.rb", "ext/gherkin_lexer_uk/extconf.rb", "ext/gherkin_lexer_uz/extconf.rb", "ext/gherkin_lexer_vi/extconf.rb", "ext/gherkin_lexer_zh_cn/extconf.rb", "ext/gherkin_lexer_zh_tw/extconf.rb"]
  s.homepage = %q{http://github.com/aslakhellesoy/gherkin}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Fast Gherkin lexer/parser}
  s.test_files = ["spec/gherkin/c_lexer_spec.rb", "spec/gherkin/formatter/argument_spec.rb", "spec/gherkin/formatter/colors_spec.rb", "spec/gherkin/formatter/filter_formatter_spec.rb", "spec/gherkin/formatter/model_spec.rb", "spec/gherkin/formatter/pretty_formatter_spec.rb", "spec/gherkin/formatter/tag_count_formatter_spec.rb", "spec/gherkin/i18n_lexer_spec.rb", "spec/gherkin/i18n_spec.rb", "spec/gherkin/java_lexer_spec.rb", "spec/gherkin/json_parser_spec.rb", "spec/gherkin/output_stream_string_io.rb", "spec/gherkin/parser/parser_spec.rb", "spec/gherkin/rb_lexer_spec.rb", "spec/gherkin/sexp_recorder.rb", "spec/gherkin/shared/lexer_group.rb", "spec/gherkin/shared/py_string_group.rb", "spec/gherkin/shared/row_group.rb", "spec/gherkin/shared/tags_group.rb", "spec/gherkin/tag_expression_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<trollop>, ["~> 1.16.2"])
      s.add_development_dependency(%q<awesome_print>, ["~> 0.2.1"])
      s.add_development_dependency(%q<rspec>, ["~> 2.0.0.beta.17"])
      s.add_development_dependency(%q<cucumber>, ["~> 0.8.5"])
      s.add_development_dependency(%q<rake-compiler>, ["~> 0.7.0"])
    else
      s.add_dependency(%q<trollop>, ["~> 1.16.2"])
      s.add_dependency(%q<awesome_print>, ["~> 0.2.1"])
      s.add_dependency(%q<rspec>, ["~> 2.0.0.beta.17"])
      s.add_dependency(%q<cucumber>, ["~> 0.8.5"])
      s.add_dependency(%q<rake-compiler>, ["~> 0.7.0"])
    end
  else
    s.add_dependency(%q<trollop>, ["~> 1.16.2"])
    s.add_dependency(%q<awesome_print>, ["~> 0.2.1"])
    s.add_dependency(%q<rspec>, ["~> 2.0.0.beta.17"])
    s.add_dependency(%q<cucumber>, ["~> 0.8.5"])
    s.add_dependency(%q<rake-compiler>, ["~> 0.7.0"])
  end
end
