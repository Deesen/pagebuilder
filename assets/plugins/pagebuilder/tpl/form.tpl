<link rel="stylesheet" href="../assets/plugins/pagebuilder/styles/styles.css?<?= $version ?>">
<script src="../assets/plugins/pagebuilder/js/jquery-ui.min.js"></script>
<script src="../assets/plugins/pagebuilder/js/interaction.js?<?= $version ?>"></script>

<div class="content-blocks-configs">
	<?php foreach ($configs as $filename => $config): ?> 
		<?= $this->renderTpl('tpl/block.tpl', [ 
			'configs' => $configs, 
			'block'   => ['config' => $filename],
		]) ?> 
	<?php endforeach; ?>
</div>
	
<?php foreach ($containers as $name => $container): ?>
	<?= $this->renderTpl('tpl/container.tpl', [
		'name'      => $name,
		'container' => $container,
		'configs'   => array_filter($configs, function($key) use ($container) {
            return in_array($key, $container['sections']);
        }, ARRAY_FILTER_USE_KEY)
	]) ?>
<?php endforeach; ?>

<?php foreach ($this->themes as $theme): ?> 
	<?= $theme ?> 
<?php endforeach; ?> 

<script>
	jQuery( function() {
		initcontentblocks( {
			containers: jQuery('.content-blocks'), 
			values: <?= json_encode( $block, JSON_UNESCAPED_UNICODE ) ?>, 
			config: <?= json_encode( $configs, JSON_UNESCAPED_UNICODE ) ?>,
			lang: <?= json_encode( $l, JSON_UNESCAPED_UNICODE ) ?>,
			browser: "<?= $browseurl ?>",
			picker: {
				yearOffset: <?= $picker['yearOffset'] ?>,
				format: '<?= $picker['format'] ?>',
				dayNames: <?= $adminlang['dp_dayNames'] ?>,
				monthNames: <?= $adminlang['dp_monthNames'] ?>,
				startDay: <?= $adminlang['dp_startDay'] ?>,
			}
		} );
	} );
</script>