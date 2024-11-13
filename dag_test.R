library(dplyr)
library(DiagrammeR)

# # Read in metadata
# metadata <- read.csv('metadata.csv')
# 
# # Unflatten metadata to create edges and nodes
# unflat <- metadata %>% 
#   tidyr::separate_rows(parent, sep=';') %>% 
#   tidyr::separate_rows(child, sep=';')

unflat <- structure(
  list(
    Product_ID = c(4047648790, 5754199350, 9000442265, 
                   9325481063, 6072493491, 5645041168, 3344276255, 2307679692, 1512337206, 
                   2824302477, 3748996607, 2008766938, 7300648833, 3855770051, 3092745195, 
                   4520627002, 3932969825, 6873647526, 8109343197, 9323872357, 7334703566, 
                   8858668888, 7829333381, 9936639753, 2463472188, 8971627055, 7253259313, 
                   7253259313, 7253259313, 7253291284), 
    Product_Name = c("wa_genbank", "wa_genbank", 
                     "wa_genbank", "wa_genbank", "lineages", "lineages", "lineages", 
                     "lineages", "lineages", "lineages", "lineages", "lineages", "lineages", 
                     "lineages", "lineages", "lineages", "lineages", "lineages", "lineages", 
                     "lineages", "lineages", "lineages", "seq_results", "seq_results", 
                     "seq_results", "seq_results", "seq_report", "seq_report", "seq_report", "genbank"
    ), 
    Location = c("network_drive", "network_drive", "network_drive", 
                 "network_drive", "network_drive", "network_drive", "network_drive", 
                 "network_drive", "network_drive", "network_drive", "network_drive", 
                 "network_drive", "network_drive", "network_drive", "network_drive", 
                 "network_drive", "network_drive", "network_drive", "network_drive", 
                 "network_drive", "network_drive", "network_drive", "local", "local", 
                 "local", "local", "network_drive", "network_drive", "network_drive", "network_drive"
    ), 
    Steward = c("DIQA", "DIQA", "DIQA", "DIQA", "DIQA", "DIQA", 
                "DIQA", "DIQA", "DIQA", "DIQA", "DIQA", "DIQA", "DIQA", "DIQA", 
                "DIQA", "DIQA", "DIQA", "DIQA", "DIQA", "DIQA", "DIQA", "DIQA", 
                "PHL", "PHL", "PHL", "PHL", "MEP", "MEP", "MEP", "DIQA"), 
    Source = c("genbank", 
               "genbank", "genbank", "genbank", "CDC", "CDC", "CDC", "CDC", 
               "CDC", "CDC", "CDC", "CDC", "CDC", "CDC", "CDC", "CDC", "CDC", 
               "CDC", "CDC", "CDC", "CDC", "CDC", "BINFX", "BINFX", "BINFX", 
               "BINFX", "", "", "", "NCBI"), 
    Users = c("DIQA; MEP", "DIQA; MEP", "DIQA; MEP", 
              "DIQA; MEP", "MEP", "MEP", "MEP", "MEP", "MEP", "MEP", "MEP", 
              "MEP", "MEP", "MEP", "MEP", "MEP", "MEP", "MEP", "MEP", "MEP", 
              "MEP", "MEP", "PHL", "PHL", "PHL", "PHL", "Public", "Public", 
              "Public", "DIQA"), 
    Keywords = c("ncbi;results;accessions;virus;refseq;upload", 
                 "ncbi;results;accessions;virus;refseq;upload", "ncbi;results;accessions;virus;refseq;upload", 
                 "ncbi;results;accessions;virus;refseq;upload", "variant", "variant", 
                 "variant", "variant", "variant", "variant", "variant", "variant", 
                 "variant", "variant", "variant", "variant", "variant", "variant", 
                 "variant", "variant", "variant", "variant", "sequencing;results;accessions;variants;lineages", 
                 "sequencing;results;accessions;variants;lineages", "sequencing;results;accessions;variants;lineages", 
                 "sequencing;results;accession;variants;lineages", "report:variants;lineages", 
                 "report:variants;lineages", "report:variants;lineages", "ncbi;metadata"), 
    PII = c("No", 
            "No", "No", "No", "No", "No", "No", "No", "No", "No", "No", "No", 
            "No", "No", "No", "No", "No", "No", "No", "No", "No", "No", "No", 
            "No", "No", "No", "No", "No", "No", "No"), 
    Connection = c("data/genbank/wa_genbank_2024-10-21.csv", 
                   "data/genbank/wa_genbank_2024-10-14.csv", "data/genbank/wa_genbank_2024-10-07.csv", 
                   "data/genbank/wa_genbank_2024-09-30.csv", "data/lineages/Lineages_2024-06-03.csv", 
                   "data/lineages/Lineages_2024-06-04.csv", "data/lineages/Lineages_2024-06-05.csv", 
                   "data/lineages/Lineages_2024-06-06.csv", "data/lineages/Lineages_2024-06-07.csv", 
                   "data/lineages/Lineages_2024-06-10.csv", "data/lineages/Lineages_2024-06-11.csv", 
                   "data/lineages/Lineages_2024-06-12.csv", "data/lineages/Lineages_2024-06-13.csv", 
                   "data/lineages/Lineages_2024-06-14.csv", "data/lineages/Lineages_2024-06-17.csv", 
                   "data/lineages/Lineages_2024-06-18.csv", "data/lineages/Lineages_2024-06-19.csv", 
                   "data/lineages/Lineages_2024-06-20.csv", "data/lineages/Lineages_2024-06-21.csv", 
                   "data/lineages/Lineages_2024-06-24.csv", "data/lineages/Lineages_2024-06-25.csv", 
                   "data/lineages/Lineages_2024-06-26.csv", "data/seq_results/results_with_ncbi_run163.csv", 
                   "data/seq_results/results_with_ncbi_run170.csv", "data/seq_results/results_with_ncbi_run172.csv", 
                   "data/seq_results/results_with_ncbi_run172b.csv", "data/seq_report/SequencingReport_2024-01-30.docx", 
                   "data/seq_report/SequencingReport_2024-01-30.docx", "data/seq_report/SequencingReport_2024-01-30.docx",
                   "data/genbank/genbank.csv"
    ), 
    parent = c("genbank", "genbank", "genbank", "genbank", NA, NA, NA, NA, NA, NA, NA, NA, 
               NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, "seq_results", 
               "lineages", "wa_genbank", NA), 
    child = c("seq_report", "seq_report", 
              "seq_report", "seq_report", "seq_report", "seq_report", "seq_report", 
              "seq_report", "seq_report", "seq_report", "seq_report", "seq_report", 
              "seq_report", "seq_report", "seq_report", "seq_report", "seq_report", 
              "seq_report", "seq_report", "seq_report", "seq_report", "seq_report", 
              "seq_report", "seq_report", "seq_report", "seq_report", NA, NA, 
              NA, "wa_genbank")), 
  class = c("tbl_df", "tbl", "data.frame"), row.names = c(NA, -30L))

# get df of nodes to create and flatten any distinct descriptor fields
nodes <- unflat %>% 
  select(Product_Name, Location, Steward, Source, Users, Keywords, PII) %>% 
  distinct() %>% 
  group_by(Product_Name) %>% 
  mutate(Product_Name_copy = Product_Name,
         Location = paste(unique(Location), collapse='| '),
         Steward = paste(unique(Steward), collapse='| '),
         Source = paste(unique(Source), collapse='| '),
         Users = paste(unique(Users), collapse='| '),
         Keywords = paste(unique(Keywords), collapse='| '),
         PII = paste(unique(PII), collapse='| ')) %>% 
  distinct()

# get df of edges to create
edges_parent <- unflat %>% filter(!is.na(parent)) %>% select(from = parent, to = Product_Name)
edges_child <-  unflat %>% filter(!is.na(child)) %>% select(from = Product_Name, to = child)
edges <- rbind(edges_parent, edges_child) %>% distinct()

ui <- fluidPage(
  h2("Clickable DiagrammeR Graph with Node Highlighting"),
  DiagrammeROutput("dag")
)

server <- function(input, output, session) {
  
  # Define a graph in DiagrammeR
  output$dag <- renderDiagrammeR({
    create_graph() %>%
      add_nodes_from_table(table = nodes, label=Product_Name) %>% #, label=Product_Name) %>%
      add_edges_from_table(table = edges, from_col = from, to_col = to, from_to_map = Product_Name_copy)
  })
}

shinyApp(ui = ui, server = server)
