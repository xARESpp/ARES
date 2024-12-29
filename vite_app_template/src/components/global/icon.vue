<script>
import * as Icons from '@element-plus/icons-vue'

// 目前仅支持引入 el 的 icon，name 的数据格式如：Location
export default (props) => {
  const { name } = props
  if (name) {
    const style = {}
    style.width = props.size
    style.height = props.size
    props.width ? style.width = props.width : ''
    props.height ? style.height = props.height : ''
    props.color ? style.color = props.color : ''
    return h(Icons[name], { style })
  }
}
</script>