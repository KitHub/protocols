project_name ?=
# proto 搜索根路径
PROTO_I := -I .



.PHONY: help proto clean 

# 默认执行：编译proto
all: help

# 编译proto生成go+grpc代码
proto: 
	@if [ -z "$(project_name)" ] ; then \
		echo "please specify 'project_name', e.g., make proto project_name=compute_operation"; \
		exit 1; \
	fi

	@if [ ! -d "$(project_name)" ] ; then \
		echo "dir '$(project_name)'' not found"; \
		exit 1; \
	fi

	@if [ ! -f "$(project_name)/$(project_name).proto" ] ; then \
		echo "file '$(project_name)/${project_name}.proto' not found"; \
		exit 1; \
	fi

	@$(MAKE) clean

	@echo "===== compiling begin ====="
	protoc $(PROTO_I) \
		--go_out=paths=source_relative:./ \
		--go-grpc_out=paths=source_relative:./ \
		--grpc-gateway_out=paths=source_relative:./ \
		--govalidators_out=paths=source_relative:./ \
		./$(project_name)/$(project_name).proto
	@echo "===== pcompiling end, files are in $(project_name) ====="
	@echo ""

# 清理所有生成的pb.go、grpc.pb.go文件
clean:
	@echo "===== clean begin ====="
	rm -rf $(project_name)/*.pb.go
	@echo "===== clean end, old-versioned go files cleared ====="
	@echo ""

# 查看帮助
help:
	@echo "useage："
	@echo "  make proto project_name=XXXX    compile proto file in some project"
	@echo "  make clean                      clear old-versioned generated go files in some project"

