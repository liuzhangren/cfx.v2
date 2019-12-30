import { 
  spacing
  font
  color
  border
  line
  opacity
} from '../../style/variables/default'

export default ({
  cfs: {
    px
    vh
    per: p
    joinS: js
    rgba
    calc
    color: c
  }
}) =>
  atTag:
    display: 'inline-block'
    padding: js [
      0 
      (spacing {px}).h.xl
    ]
    height: px 60
    color: color.grey[1]
    fontSize: (font {px}).size.base
    textAlign: 'center'
    lineHeight: px 58
    verticalAlign: 'middle'
    border: js [
      px 1
      'solid'
      color.bg.grey
    ]
    borderRadius: (border {
      px
      p: per
    }).radius.md
    backgroundColor: color.bg.grey
    boxSizing: 'border-box'
    '&--primary':
      color: color.grey[1]
      borderColor: color.bg.grey
      backgroundColor: color.bg.grey
    '&--active':
      color: color.brand.light
      borderColor: color.brand.light
      backgroundColor: '#fff'
      '&.at-tag--primary':
        color: color.text.base.inverse
        borderColor: color.brand.light
        backgroundColor: color.brand.light
    '&--disabled':
      opacity: opacity.disabled
    '&--circle':
      borderRadius: px 30
      backgroundClip: 'border-box'
      overflow: 'hidden'
    '&--small':
      padding: js [
        0
        (spacing {px}).h.md
      ]
      height: px 40 
      fontSize: (font {px}).size.sm
      lineHeight: px 38
      '&.at-tag--circle':
        borderRadius: px 20
