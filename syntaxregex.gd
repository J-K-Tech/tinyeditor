class_name tinySyntaxHighlighter
extends SyntaxHighlighter
var utf=';'.to_utf8_buffer()[0]
func _get_line_syntax_highlighting(line: int) -> Dictionary:
	var editor=get_text_edit()
	var text=editor.get_line(line)
	var high={}
	if text.begins_with(';'):
		var color=Color.GREEN
		var charasterisk=text.to_utf8_buffer()
		for i in charasterisk:
			if (i!=utf):break
			else:
				color.h+=0.05
				if color.h>=1:
					color.h=0
		high[0]={"color":color}
		return high
	if text.begins_with("set"):
		high[0]={"color":Color.YELLOW}
		high[4]={"color":Color.CYAN}
		var eqpos=text.find('=')
		if eqpos!=-1:
			high[eqpos]={"color":Color.RED}
			high[eqpos+1]={"color":Color.MAGENTA}
		return high
	if text.begins_with("%"):
		high[0]={"color":Color.YELLOW}
		high[1]={"color":Color.CYAN}
		high[text.rfind("%")]={"color":Color.YELLOW}
		return high
	if text.begins_with("\\n"):
		high[0]={"color":Color.YELLOW}
		high[2]={"color":Color.GREEN}
	return high
	
