{% if hot_courses is not null and hot_courses is not empty %}

<script>
$(document).ready( function() {
    $('.star-rating li a').on('click', function(event) {
        var id = $(this).parents('ul').attr('id');
        $('#vote_label2_' + id).html("{{'Loading'|get_lang}}");
        $.ajax({
            url: $(this).attr('data-link'),
            success: function(data) {
                $("#rating_wrapper_"+id).html(data);
                if (data == 'added') {
                    //$('#vote_label2_' + id).html("{{'Saved'|get_lang}}");
                }
                if (data == 'updated') {
                    //$('#vote_label2_' + id).html("{{'Saved'|get_lang}}");
                }
            }
        });
    });
});
</script>
<section id="hot_courses">
    <div class="panel panel-default">
        <div class="panel-heading">
            {{ "HottestCourses"|get_lang}}
            {% if _u.is_admin %}
            <span class="pull-right">
                <a title="{{ "Hide"|get_lang }}" alt="{{ "Hide"|get_lang }}" href="{{ _p.web_main }}admin/settings.php?search_field=show_hot_courses&submit_button=&_qf__search_settings=&category=search_setting">
                    <img src="{{ "eyes.png"|icon(22) }}" width="22" height="22">
                </a>
            </span>
            {% endif %}

        </div>
        <div class="panel-body">
            {% include template ~ '/layout/hot_course_item.tpl' %}
        </div>
    </div>
</section>
{% endif %}
