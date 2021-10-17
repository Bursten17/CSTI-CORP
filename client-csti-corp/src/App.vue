<template>
	<div class="layout-wrapper layout-overlay" >
		<div class="layout-topbar">
            <div>
                CSTI CORP EXAMEN
            </div>
	    </div>
		<div class="layout-main">
			<router-view />
		</div>
        <Toast />
	</div>
</template>

<script>

export default {
    data() {
        return {
        }
    },
}
</script>

<style lang="scss">
@import './App.scss';
</style>
