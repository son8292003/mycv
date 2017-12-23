module Themes::CamaleonFirst::MainHelper
  def self.included(klass)
    klass.helper_method [:camaleon_first_list_select] rescue "" # here your methods accessible from views
  end

  def camaleon_first_settings(theme)

  end

  # return a list of options for "Recent items from " on site settings -> theme settings
  def camaleon_first_list_select
    res = []
    current_site.the_post_types.decorate.each {|p| res << "<option value='#{p.the_slug}'>#{p.the_title}</option>" }
    res.join("").html_safe
  end

  def camaleon_first_on_install_theme(theme)
    group = theme.add_field_group({name: "Home Page", slug: "home_page"})
    group.add_field({"name"=>"Home Page", "slug"=>"home_page", description: "Select your home page"},{field_key: "posts", post_types: "all"})
    group.add_field({"name"=>"Recent items from", "slug"=>"recent_post_type"}, {field_key: "select_eval", command: "camaleon_first_list_select"})
    group.add_field({"name"=>"Maximum of items", "slug"=>"home_qty"}, {field_key: "numeric", default_value: 6})

    group = theme.add_field_group({name: "Personal Details", slug: "personal_details"})
    group.add_field({"name"=>"Name", "slug"=>"pd_name"}, {field_key: "editor", default_value: "Your Name"})
    group.add_field({"name"=>"Job title", "slug"=>"pd_job_title"}, {field_key: "editor", default_value: "job title"})
    group.add_field({"name"=>"Name on table", "slug"=>"pd_name_on_table"}, {field_key: "editor", default_value: "Your Name"})
    group.add_field({"name"=>"Date of birth", "slug"=>"pd_dob"}, {field_key: "editor", default_value: "01/01/2001"})
    group.add_field({"name"=>"Phone", "slug"=>"pd_phone"}, {field_key: "editor", default_value: "+999 98765432"})
    group.add_field({"name"=>"Email", "slug"=>"pd_email"}, {field_key: "editor", default_value: "no-reply@somedomainname.com"})
    group.add_field({"name"=>"Description", "slug"=>"pd_description"}, {field_key: "editor", default_value: "Some description about yourself....Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem."})

    group = theme.add_field_group({name: "Footer", slug: "footer"})
    group.add_field({"name"=>"Column Left", "slug"=>"footer_left"}, {field_key: "editor", translate: true, default_value: "<h4>My Contacts</h4><p>Some Address 987,<br> +34 9054 5455 </p>"})
    group.add_field({"name"=>"Column Center", "slug"=>"footer_center"}, {field_key: "editor", translate: true, default_value: "<h4>Link to this project:</h4> <p> <br> <a href='https://github.com/son8292003/mycv'>mycv</a></p>"})
    group.add_field({"name"=>"Column Right", "slug"=>"footer_right"}, {field_key: "editor", translate: true, default_value: "<h4>About Theme</h4><p>Modified from camaleon_first theme.</p>"})


    profession_pt = current_site.post_types.create({name: 'Professional_Skills', slug: 'Professional_skills'.to_s.parameterize, description: 'Professional Skills', data_options: {has_category: false, has_tags: false, not_deleted: true, has_summary: false, has_content: true, has_comments: false, has_picture: false, has_template: false}})

    profession_pt.add_post(title: "skill1", post_order: 1, content: "skill 1 description");
    profession_pt.add_post(title: "skill2", post_order: 2, content: "skill 2 description");
    profession_pt.add_post(title: "skill3", post_order: 3, content: "skill 3 description");
    profession_pt.add_post(title: "skill4", post_order: 4, content: "skill 4 description");

    
    exp_pt = current_site.post_types.create({name: 'Work_Experience', slug: 'Work_Experience'.to_s.parameterize, description: 'Work Experience', data_options: {has_category: false, has_tags: false, not_deleted: true, has_summary: false, has_content: true, has_comments: false, has_picture: false, has_template: false}})

    exp_pt.add_field({name: "Period", slug: "exp_period", description: "Experience period"}, {field_key: "text_box"})
    exp_pt.add_post(title: "exp1", post_order: 1, content: "Exp 1 description", fields: {exp_period: '01/01/2011 - 01/01/2012'});
    exp_pt.add_post(title: "exp2", post_order: 2, content: "Exp 2 description", fields: {exp_period: '02/01/2012 - 01/01/2013'});
    exp_pt.add_post(title: "exp3", post_order: 3, content: "Exp 3 description", fields: {exp_period: '02/01/2013 - 01/01/2014'});
    exp_pt.add_post(title: "exp4", post_order: 4, content: "Exp 4 description", fields: {exp_period: '02/01/2014 - Current'});


    edu_pt = current_site.post_types.create({name: 'Education', slug: 'Education'.to_s.parameterize, description: 'Education', data_options: {has_category: false, has_tags: false, not_deleted: true, has_summary: false, has_content: true, has_comments: false, has_picture: false, has_template: false}})

    edu_pt.add_field({name: "Period", slug: "edu_period", description: "Education period"}, {field_key: "text_box"})
    edu_pt.add_post(title: "edu1", post_order: 1, content: "Edu 1 description", fields: {edu_period: '01/01/2011 - 01/01/2012'});
    edu_pt.add_post(title: "edu2", post_order: 2, content: "Edu 2 description", fields: {edu_period: '02/01/2012 - 01/01/2013'});
    edu_pt.add_post(title: "edu3", post_order: 3, content: "Edu 3 description", fields: {edu_period: '02/01/2013 - 01/01/2014'});
    edu_pt.add_post(title: "edu4", post_order: 4, content: "Edu 4 description", fields: {edu_period: '02/01/2014 - Current'});
=begin
    extra_post_type = [
           {name: 'Personal_Details', description: 'Personal Details', options: {has_category: false, has_tags: false, not_deleted: true, has_summary: false, has_content: true, has_comments: false, has_picture: false, has_template: false }}
       ]

    extra_post_type.each do |pt|
         model_pt = current_site.post_types.create({name: pt[:name], slug: pt[:name].to_s.parameterize, description: pt[:description], data_options: pt[:options]})
         model_pt.add_field({name: "Name", slug: "personal_name"}, {field_key: "text_box", translate: false})
    end
=end

  end

  def camaleon_first_on_uninstall_theme(theme)
    theme.destroy
  end
end
