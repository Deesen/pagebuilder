<div class="field type-<?= $field['type'] ?>" data-field="<?= $name ?>">
	<? if ( !empty( $field['caption'] ) ) { ?> 
		<div class="field-name"><?= $field['caption'] ?></div>
	<? } ?> 
	<div class="preview"></div>
	<input type="button" class="open-browser" value="<?= $l['Choose'] ?>"><input type="text" name="contentblocks_<?= $name ?>" value="<?= htmlentities( $value ) ?>">
</div>