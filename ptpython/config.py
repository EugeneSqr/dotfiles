__all__ = ["configure"]


def configure(repl):
    repl.highlight_matching_parenthesis = True
    repl.complete_while_typing = False
    repl.vi_mode = True
    repl.confirm_exit = False
    repl.enable_input_validation = True
    repl.use_code_colorscheme("monokai")
