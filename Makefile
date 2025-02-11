all: ud1 ud2 ud3 ud4 ud5_1

LOCAL_URL=http://127.0.0.1:8000/

OUTPUT_DIR=./pdf/

gettitle=$(shell grep -m 1 '# ' $1 | sed -r 's/^# //')

PREFIX=SMR_SOM_


# Directorio que contiene los archivos .md
MD_DIR=docs/

# Archivos a ignorar
IGNORE_FILES=$(MD_DIR)index.md $(MD_DIR)README*.md $(MD_DIR)*_es.md

# Función para procesar todos los archivos .md en el directorio
process_all_md:
	@if command -v parallel >/dev/null 2>&1; then \
		parallel --gnu \
		'title=$$(grep -m 1 "# " {} | sed -r "s/^# //"); \
		relative_path=$$(realpath --relative-to=$(MD_DIR) {}); \
		filename=$$(basename {} .md); \
		echo "Processing: $${filename}"; \
		node exportpdf.js $(LOCAL_URL)$${relative_path%.md} $(OUTPUT_DIR)$(PREFIX)$${filename}.pdf "$${title}"' \
		::: $(filter-out $(IGNORE_FILES), $(wildcard $(MD_DIR)**/*.md)); \
	else \
		for file in $(filter-out $(IGNORE_FILES), $(wildcard $(MD_DIR)**/*.md)); do \
			title=$$(grep -m 1 "# " $$file | sed -r "s/^# //"); \
			relative_path=$$(realpath --relative-to=$(MD_DIR) $$file); \
			filename=$$(basename $$file .md); \
			echo "Processing: $$filename"; \
			node exportpdf.js $(LOCAL_URL)$${relative_path%.md} $(OUTPUT_DIR)$(PREFIX)$$filename.pdf "$$title"; \
		done; \
	fi

# Función para procesar todos los archivos .md en el directorio
# process_all_md:
# 	@for file in $(wildcard $(MD_DIR)*.md); do \
# 		title=$$(grep -m 1 '# ' $$file | sed -r 's/^# //'); \
# 		filename=$$(basename $$file .md); \
# 		node exportpdf.js $(LOCAL_URL)$$filename $(OUTPUT_DIR)$(PREFIX)$$filename.pdf "$$title"; \
# 	done

# UD1_MD=unit01
# UD3_MD=unit03
# UD4_MD=unit04
# UD5_DIR=unit05/
# UD5_1_MD=unit05_01



# ud1: docs/$(UD1_MD).md
# 	$(eval title := $(call gettitle, $<) )
# 	node exportpdf.js $(LOCAL_URL)$(UD1_MD) $(OUTPUT_DIR)$(PREFIX)$(UD1_MD).pdf "$(title)"

# UD2_MD=unit02

# ud2: docs/$(UD2_MD).md
# 	$(eval title := $(call gettitle, $<) )
# 	node exportpdf.js $(LOCAL_URL)$(UD2_MD) $(OUTPUT_DIR)$(PREFIX)$(UD2_MD).pdf "$(title)"

# ud3: docs/$(UD3_MD).md
# 	$(eval title := $(call gettitle, $<) )
# 	node exportpdf.js $(LOCAL_URL)$(UD3_MD) $(OUTPUT_DIR)$(PREFIX)$(UD3_MD).pdf "$(title)"

# ud4: docs/$(UD4_MD).md
# 	$(eval title := $(call gettitle, $<) )
# 	node exportpdf.js $(LOCAL_URL)$(UD4_MD) $(OUTPUT_DIR)$(PREFIX)$(UD4_MD).pdf "$(title)"

# ud5_1: docs/$(UD5_DIR)$(UD5_1_MD).md
# 	$(eval title := $(call gettitle, $<) )
# 	node exportpdf.js $(LOCAL_URL)$(UD5_DIR)$(UD5_1_MD) $(OUTPUT_DIR)$(PREFIX)$(UD5_1_MD).pdf "$(title)"

clean:
	rm $(OUTPUT_DIR)*
	rm -f $(OUTPUT_DIR)/*.pdf
