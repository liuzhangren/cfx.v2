active = (colorGrey5) =>
  transition: "#{bcolorGrey5} 0.3s"
  ':active':
    backgroundColor: colorGrey5

# 元素居中定位
absoluteCenter = (pos: 'absolute') =>
  positon: pos
  top: '50%'
  left: '50%'
  transform: transform '-50%', '-50%'

alignhack = (position: 'before', margintop: '1px') =>
  "$::#{position}":
    content: ''
    display: 'inline-block'
    verticalAlign: 'middle'
    width: 0
    height: '100%'
    marginTop: margintop

borderThin = (
  color ,
  style: 'solid',
  directions: ['top', 'bottom', 'right', 'left'],
  width: '1px',
) =>
  directions.map (item) =>
    "border-#{item}": "#{width} #{color} #{style}"

borderThinTop = (
  color ,
  style: 'solid',
  width: '1px'
) =>
  borderThin color, style, 'top', width

export {
  active
  absoluteCenter
  alignhack
}
