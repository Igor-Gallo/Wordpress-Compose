<?php
/**
 * Plugin Name: Meu plugin
 */

 function my_content_footer ($content) {
    if (is_single()) {
        return $content . "<p>Muito obrigado pela visita!!! </p>";   
    }
 }
 add_filter('the_content', 'my_content_footer')