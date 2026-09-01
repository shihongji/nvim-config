-- YAML frontmatter snippet for markdown notes.
--
-- Type `fm` in a markdown buffer and expand (Tab) to stub the full schema.
-- Controlled-vocabulary fields are LuaSnip choiceNodes: cycle the options with
-- <C-l> (LazyVim's default choice-next). Date fields default to today.
--
-- The vocabularies below are deliberately generic. Adapt `status`, `topic` and
-- `audience` to whatever taxonomy a given notes repo uses — the snippet is the
-- mechanism; the word lists are only defaults.
return {
  "L3MON4D3/LuaSnip",
  opts = function(_, opts)
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local c = ls.choice_node
    local f = ls.function_node

    local function today()
      return os.date("%Y-%m-%d")
    end

    ls.add_snippets("markdown", {
      s("fm", {
        t({ "---", "title: " }),
        i(1, "One-line title"),
        t({ "", "status: " }),
        c(2, {
          t("active"),
          t("resolved"),
          t("superseded"),
          t("reference"),
          t("wontfix"),
        }),
        t({ "", "topic: " }),
        c(3, {
          t("investigation"),
          t("rca"),
          t("playbook"),
          t("code-smell"),
          t("plan"),
          t("note"),
        }),
        t({ "", "tags: [" }),
        i(4, "tag"),
        t({ "]", "audience: " }),
        c(5, { t("null"), t("self"), t("team"), t("public") }),
        t({ "", "severity: " }),
        c(6, { t("null"), t("high"), t("medium"), t("low") }),
        t({ "", "created: " }),
        f(today),
        t({ "", "last_seen: " }),
        i(7, ""),
        t({ "", "last_checked: " }),
        f(today),
        t({ "", "resolved: " }),
        c(8, { t("false"), t("true") }),
        t({ "", "recurrence: " }),
        c(9, { t("null"), t("episodic"), t("continuous"), t("one-time") }),
        t({ "", "related: []", "---", "", "# " }),
        i(0),
      }),
    })
  end,
}
