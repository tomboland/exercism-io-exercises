pub mod graph {
    use std::collections::HashMap;
    fn attrs_from_strtup(strtup: &[(&str, &str)]) -> HashMap<String, String> {
        strtup
            .iter()
            .cloned()
            .map(|(fst, snd)| (fst.into(), snd.into()))
            .collect()
    }
    pub mod graph_items {
        pub mod node {
            use super::super::attrs_from_strtup;
            use std::collections::HashMap;
            #[derive(Clone, PartialEq, Debug)]
            pub struct Node {
                pub name: String,
                pub attrs: HashMap<String, String>,
            }
            impl Node {
                pub fn new(name: &str) -> Self {
                    Node {
                        name: name.into(),
                        attrs: HashMap::new(),
                    }
                }
                pub fn with_attrs(
                    self: Self,
                    strtup: &[(&str, &str)],
                ) -> Self {
                    Node {
                        attrs: attrs_from_strtup(strtup),
                        ..self
                    }
                }
                pub fn get_attr(self: Self, attr: &str) -> Option<String> {
                    self.attrs.get(attr).cloned()
                }
            }
        }

        pub mod edge {
            use super::super::attrs_from_strtup;
            use std::collections::HashMap;
            #[derive(Clone, PartialEq, Debug)]
            pub struct Edge {
                pub source: String,
                pub target: String,
                pub attrs: HashMap<String, String>,
            }
            impl<'a> Edge {
                pub fn new(source: &str, target: &str) -> Self {
                    Edge {
                        source: source.into(),
                        target: target.into(),
                        attrs: HashMap::new(),
                    }
                }
                pub fn with_attrs(self: Self, strtup: &[(&str, &str)]) -> Self {
                    Edge {
                        attrs: attrs_from_strtup(strtup),
                        ..self
                    }
                }
            }
        }
    }
    use graph_items::edge::Edge;
    use graph_items::node::Node;
    #[derive(Default, PartialEq)]
    pub struct Graph {
        pub nodes: Vec<Node>,
        pub edges: Vec<Edge>,
        pub attrs: HashMap<String, String>,
    }

    impl<'a> Graph {
        pub fn new() -> Self {
            Default::default()
        }
        pub fn with_nodes(self: Self, nodes: &[Node]) -> Self {
            Graph {
                nodes: nodes.to_vec(),
                ..self
            }
        }
        pub fn with_edges(self: Self, edges: &[Edge]) -> Self {
            Graph {
                edges: edges.to_vec(),
                ..self
            }
        }
        pub fn with_attrs(self: Self, strtup: &[(&str, &str)]) -> Self {
            Graph {
                attrs: attrs_from_strtup(strtup),
                ..self
            }
        }
        pub fn get_node(self: Self, name: &str) -> Option<Node> {
            self.nodes.iter().find(|x| x.name == name).cloned()
        }
    }
}
